Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8B8C433F5
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ww1iQqQ8Um4+K0Od6jvyKcj7jN6r1Wk51nkgcLKJiDo=; b=svSIc5X8TH0dWH
	JLrGBOKpA4CLlyaYE5svml5j9F9rpQoMr6j+4lbDocO3/3uIaPeeVxT7PwUqn94LLBf4iwXRU+PhJ
	02GK4CES68QaGT/OQDXQsQSFFhEyAjUh1pI5VP+SJZWjBqGeyfqRpeT+0i9wc155EkFzi/KzRIN3X
	uCKaaXvfbQfYQTpJcyFIEzzP6pqPtGSbNlEMRsfuek3Sa2Qyj7FMaIwEN/0Wgf35JXv7gn1Ioe0As
	uFySW6VPo/J+1HaLTFU1O0R+KJWmy7b6XBgZROeXNzuOjCQulirZbQ7AR7WK/PnqYHeROVdg22OVZ
	ZhMP7/R3F16hA23qKfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmgbf-00HPyT-Lr; Thu, 05 May 2022 18:53:43 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmgbd-00HPxm-4i
 for ath11k@lists.infradead.org; Thu, 05 May 2022 18:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651776821; x=1683312821;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6K3FhPasgUzSaU/OmGtcCnFeLokRAoKZ4RBJ1sDfmKc=;
 b=Rv37f+arrp4gfRF3rMiDBU/fIrq7RNKz/7oxqk4s4HxwmVNu0Xy7wUJ8
 XrN+DOScrXD8IlEuPwU8rktcWFgrIBo/uUABSMGPYDJFyWrsOl51XOJoY
 o+AuCPPwyT8hzhgDcIMkyVgIHPK50hniiCOBHMwAJIJQ5wrCzhl6x4Cnm U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 May 2022 11:53:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 11:53:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 11:53:39 -0700
Received: from [10.110.125.2] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 11:53:38 -0700
Message-ID: <70b3bf3f-4b34-149a-ce1c-a8e857c6a3ac@quicinc.com>
Date: Thu, 5 May 2022 11:53:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] ath11k: Don't check arvif->is_started before sending
 management frames
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220505013851.1548789-1-quic_bqiang@quicinc.com>
 <20220505013851.1548789-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220505013851.1548789-3-quic_bqiang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_115341_254260_E5954F99 
X-CRM114-Status: UNSURE (   3.73  )
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

On 5/4/2022 6:38 PM, Baochen Qiang wrote:
> Commit 66307ca04057 ("ath11k: fix mgmt_tx_wmi cmd sent to FW for
> deleted vdev") wants both of below two conditions are true before
> sending management frames:
> 
> 1: ar->allocated_vdev_map & (1LL << arvif->vdev_id)
> 2: arvif->is_started
> 
> Actually the second one is not necessary cause with the first one

nit: s/cause/because/


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
