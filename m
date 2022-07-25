Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FCEC43334
	for <ath11k@archiver.kernel.org>; Mon, 25 Jul 2022 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EAWk8uXnaAoiVx1xJrbJ5TbgdToRrh6OcLoN5TF/EY=; b=cPaqMolNq5WhXx
	J2amdFB4hwkxVCvSEMQPPS9q6dpXPJFhg0X2FFBtajc+kc0f42UWrwcDc8yLn4ZkUmbk+aPaZluxn
	XEMTLq8h1kZ7TAzIvwnXFllxh1JLTK9UNaDO+OeV+1/IAdci8oBuO0XYEEMA9Vtte4Od1CDZmzxrz
	PcElBrrtQ8ZMZtQxlP1yuruKZo98E4KzKetlHJAZKKAoKV9wVQHXD9GK5kNZrv5bwz5o757cLUgMJ
	xpa0Nk/ufA93kMSLDSnWiEOcx1CMDEXmnMN1yYE5K+MX9B5+7DG+jw4y6E0rBG2Yw3m/zn1A4B8+w
	CO3ghgOPqa/D9JryO7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0Pe-00FVrB-1m; Mon, 25 Jul 2022 15:54:30 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0Km-00FTPa-Qz
	for ath11k@lists.infradead.org; Mon, 25 Jul 2022 15:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658764168; x=1690300168;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5YsvTZ3SLUl41q6/6VelaZT7+ASuvmaPGGxeejvVPBI=;
  b=dd+MAi8dnAe2Sgzb3UkaxKHFYuQajYqRF076hEhioi49UAZJlEzyA4sY
   noLMi2gQdRGTVr7PiwzrsAGl4yggcmESxyz77xxF5Le1NgMOEYoi+ZpIN
   XRo/W/5RPpVWqVSbhJyAkstzMFRPFiY7VWQjlbyVucUP3UjYx3OTauodI
   o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 Jul 2022 08:49:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 08:49:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 08:49:22 -0700
Received: from [10.110.46.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 25 Jul
 2022 08:49:21 -0700
Message-ID: <0c282a64-2ee7-f50f-1cbb-4c47b9089736@quicinc.com>
Date: Mon, 25 Jul 2022 08:49:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ath11k: Add support to get power save duration for each
 client
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
	<ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>
References: <20220725054601.14719-1-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220725054601.14719-1-quic_tamizhr@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_084929_007938_5259D4E7 
X-CRM114-Status: UNSURE (   4.37  )
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

On 7/24/2022 10:46 PM, Tamizh Chelvam Raja wrote:
> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
[snip]
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

wrong order of S-O-Bs?

Author should be first, then the patch sender should be 2nd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
