Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90446C4332F
	for <ath11k@archiver.kernel.org>; Thu,  2 Dec 2021 03:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2J9oe0XIgYYfOhG8WG6urXjT9xrWs+32u9zQF7G06k=; b=qWjX7yblxZQI0e
	sUXwamdIbu3jVOFl3VMyiPbzC2AC7lYSsNRiohimkq4tLaPhvMBp8FSX7e96rxusEdEERUDNFOfmv
	TvC8Yc3L3UnsJy/6LhDsE62miDytaxXzhn2VMoZeXxQSJ2tNrYOVUBlIoGIz+p64B4b0fAnFAPnLq
	I2DhXmWSxnfQu2ZoFDKXD3PPel1u/rqLheSGPCjL+bC4RI220/ihLVcr0//n0A6JcL/IxUZ9l9C5j
	4gmQi+co8lSiOR+pE2lbHUcRTEd2FmyDv46Gv9D+Z04PDs9DDQbDOGYo0zwr+1dWCefV8C9cn6CKM
	YYacTJd5yYl1bFDiqUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mscUq-00AgD2-Lb; Thu, 02 Dec 2021 03:10:56 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mscUo-00AgCc-Ai
 for ath11k@lists.infradead.org; Thu, 02 Dec 2021 03:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638414654; x=1669950654;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YEDLJoTCAsBp+M3JgQD45uLv2yfCKVYia8n2l6RpX/0=;
 b=zLh0/QDYMZleSg501JOUqOllifRlb3+SiDpb3171DllO5pSpUQhez3DJ
 AxLiz7iAm0iMmvdHvDFb0MyUVfKUSG5MQQEceEShO7azeVqArgKO8p+iO
 YNAv+46KjZWz7kblmAdIeiYTVq5NKDTrlgfPVlO7TtcgSHFHkMGXrGYOY Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Dec 2021 19:10:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 19:10:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 1 Dec 2021 19:10:52 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 1 Dec 2021
 19:10:50 -0800
Message-ID: <c3769eeb-accd-2e31-78e4-d792e491b727@quicinc.com>
Date: Thu, 2 Dec 2021 11:10:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] ath11k: add wait operation for tx management packets
 for flush from mac80211
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211126064934.26490-1-quic_wgong@quicinc.com>
 <163836730490.316.5064011158500804861.kvalo@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <163836730490.316.5064011158500804861.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_191054_454609_E5760D29 
X-CRM114-Status: UNSURE (   5.21  )
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

On 12/1/2021 10:01 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> wrote:
>
>> ...
> Fails to apply:
>
> error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:5224
> error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
> stg import: Diff does not apply cleanly
>
> Patch set to Changes Requested.

The conflict is caused by below commit which commit on 2021-11-29, my v3 
patch is sent on 2021-11-26.

I will rebase it.

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k/mac.c?id=a93789ae541c7d5c1c2a4942013adb6bcc5e2848

ath11k: Avoid NULL ptr access during mgmt tx cleanupath


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
