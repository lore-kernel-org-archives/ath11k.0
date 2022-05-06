Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F0FC433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 01:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQBBya2UBF6XByjcJOv+fR6HI/fSxc7u09oxlOQx1q4=; b=RseJWmkUmDi6M1
	xOCdW1gSXkK5AuBZNhxoqj+ILsHPpeB89/hc7axdw14GzWlw+w572ss6Al+hf1wClaj8amcsIXKih
	BoDsxIcRSL4ko6zeX0Uv5QYNOkA6dQ2/QG6yb9pitGDjBD/HJmZi8I1rJ49xFssvgIm6jPK0agtNj
	sSzyyH5bDRpeVO78zQG7qwor9RzJHhSQDXzCq6JwZTFy5vr9S74sBMY3ynSovjSbp/ggrNVXXDyov
	aLxDUY/tt0G3iQJw6loUb2k4hVtF3nRumcX38y2MmQyGhGv4u53lImBCPwnQ5nTPrUroHKCMurFLq
	eYpDMZqhgw9WnlazcOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmmoW-000n4z-6W; Fri, 06 May 2022 01:31:24 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmmoU-000n47-Ap
 for ath11k@lists.infradead.org; Fri, 06 May 2022 01:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651800682; x=1683336682;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1RJ168iv1bTSwYVxSKxXDs5SZ7Oy7zBPAzxRcvnaTYI=;
 b=nWIuQfA9e3AHvFv6fyjKFvdw8Lmm5LlLwYMTNFb062V5iJrb2tGweOFZ
 gu/5VXXQHvqv+1T9FtpgrJV1nNnsybtdkVV98X/oGDA2mtZj6SG7CA8wz
 j1TTxOe4C3dgGMdbERL/InvBjawRG7xxP2jyvp330UOzrirn6RA18jWif w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 05 May 2022 18:31:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:31:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 18:31:20 -0700
Received: from [10.253.34.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 18:31:19 -0700
Message-ID: <23e17fea-57f6-3908-c373-fbfcb766f25d@quicinc.com>
Date: Fri, 6 May 2022 09:31:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] ath11k: Don't check arvif->is_started before sending
 management frames
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220505013851.1548789-1-quic_bqiang@quicinc.com>
 <20220505013851.1548789-3-quic_bqiang@quicinc.com>
 <70b3bf3f-4b34-149a-ce1c-a8e857c6a3ac@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <70b3bf3f-4b34-149a-ce1c-a8e857c6a3ac@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_183122_453774_52EDA461 
X-CRM114-Status: UNSURE (   4.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 5/6/2022 2:53 AM, Jeff Johnson wrote:
> On 5/4/2022 6:38 PM, Baochen Qiang wrote:
>> Commit 66307ca04057 ("ath11k: fix mgmt_tx_wmi cmd sent to FW for
>> deleted vdev") wants both of below two conditions are true before
>> sending management frames:
>>
>> 1: ar->allocated_vdev_map & (1LL << arvif->vdev_id)
>> 2: arvif->is_started
>>
>> Actually the second one is not necessary cause with the first one
>
> nit: s/cause/because/
>
Thanks Jeff, will address it in v2.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
