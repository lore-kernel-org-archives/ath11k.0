Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D7C433F5
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 03:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGESOdx0NKAYW3HXJ/Bzc1eu4nPWcCwUcTbRur9IcsI=; b=EGZyj3ItW99Ohf
	I7n/SQXwZ1x/b2nGmlGRk1tm+HXkVzXayJ2Jance7fenKA9oAGVorpIiTxiOKNHK85bXbzuF5npnL
	fKR9W6i03oG7tVdlycckWeBJNBg7RQiAolK5+JrHu+4Itp2xpYA5mgSnY53rtEuOQC4fXu0IKi5/S
	ei+2mT/HtKedqinBv/gojg+l1xPfWPfCw9K+npz6zjpIiArBXb5/DugdxnPJoxmgbXQ5RYgBFvZQw
	JPzOaU5VU01N0WhXrrmevML8B146zLYLdRttrziga2Sa85eV+y9GrcahvQs6jSLZvr47QoWF0shGn
	Ly+QmqhGijkVBfccDYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu4hJ-002Xj5-7y; Mon, 06 Dec 2021 03:29:49 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu4hF-002XiV-Ub
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 03:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638761385; x=1670297385;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sB/d1mkmPUKJT68Yrx31VUTayqORBAAs9fOSofT7vuo=;
 b=vt1vYaVVov9HJGyLrQPmTQRYadvNIt6+CZaM+Q4hXtWUuq+3R7Gv71Nb
 K+8wWymP2rr60+XfgPe/1zGhVVMierceGeGsaaZ8txAFOe6zdI+2IJC5v
 lxZgdoj+4dHyarJ/zBrzszg+rQtfGwCU4UqRQJwU3/y0nsV3Hvjb5D1ZS Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Dec 2021 19:29:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2021 19:29:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 5 Dec 2021 19:29:43 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 5 Dec 2021
 19:29:42 -0800
Message-ID: <7318ffac-f5ec-4c1b-3e80-c816bdb28a79@quicinc.com>
Date: Mon, 6 Dec 2021 11:29:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
Content-Language: en-US
To: Sven Eckelmann <sven@narfation.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
 <1854698.r8H18GsEis@ripper>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <1854698.r8H18GsEis@ripper>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_192946_079309_AE162CBE 
X-CRM114-Status: UNSURE (   8.07  )
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

On 12/3/2021 10:09 PM, Sven Eckelmann wrote:
> On Monday, 29 November 2021 11:13:09 CET Wen Gong wrote:
...
> I've tested this on ath-next on commit a93789ae541c ("ath11k: Avoid NULL ptr
> access during mgmt tx cleanup") with a WCN6856 card (EmWicon/jjplus WMX7205)
> with firmware WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1. ath-next
> was required for me because 32 MSI vectors are not available on the
> used system.
>
> Without this patch, it works fine. With patch, I just have to connect to an AP
> via wpa_supplicant to crash the system. See the attached x86-64 .config, the
> stacktrace and the decoded stacktrace.

I did test in my setup, not see the crash.

I am afraid you also need this patch("ath11k: change to use dynamic 
memory for channel list of scan",

https://patchwork.kernel.org/project/linux-wireless/patch/20211129110939.15711-1-quic_wgong@quicinc.com 
)

Could you apply this patch and try again?

> Kind regards,
> 	Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
