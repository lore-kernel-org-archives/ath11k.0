Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E2C433EF
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdfo9OWhHwwFG+IPf82MZUbICwwo1I9YOUPINZq2+7Y=; b=RZ7g11g8FNYlaw
	5l5mDi888JK/0sVaoUS9IB7UoHJLVZ/EFduBdplJHtuljnMN7+/q/ZT2x+KWR8wisvwojjr/T5PVh
	DTtm7eKLiUyjRbip6oamXkuG94tt89u7yxJeG0QMXackDoyyy9+wNIGmDF9RriGUemk6qxg0mGVd7
	gD/fJVU7FBwCRKpnINm/w/p3GRvYZvG0nXNdSr2S+Qvwg4pBXEnzkfTpwWtWa8jYp/77cfMs0lVW0
	/IM77XLyeEHIo1vAw5qPvv2WuXYPzcuys57WtjoaJUFYCH2DPP53pB95ngBTxPT3jyxTKmueIx98B
	Hx0NHhpkq4EQPIeTRm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXiFl-001w0K-Pr; Fri, 25 Mar 2022 11:37:13 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXiFj-001w03-Fi
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 11:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648208231; x=1679744231;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nPYVk9arwWFvU+RIobR85FG3FuDaKZfRncLXiNUgpOU=;
 b=p5TmGDF326qTsCwCx7VmepNKeN7l9jgVaAK+uD+Qj1xSc9CmCImKGSQv
 jC8v4KRRIZr1vpOcfnNyzlLvyMumbdnxtlpGBVfCXv+PMm7i+JuV5H5vu
 wTl6nEKEgoq4vQoQOVBEjcW+7z59REg60xuB3kTgeYT0pwpqwI+HG9KPH 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Mar 2022 04:37:07 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 04:37:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 25 Mar 2022 04:37:07 -0700
Received: from [10.253.13.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 25 Mar
 2022 04:37:06 -0700
Message-ID: <8d5afd24-71d6-d57b-960a-24d3858d295b@quicinc.com>
Date: Fri, 25 Mar 2022 19:37:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ath11k: reduce the wait time of 11d scan and hw scan
 while add interface
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220322124226.18347-1-quic_wgong@quicinc.com>
 <164820512408.2234.13144214774407671269.kvalo@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <164820512408.2234.13144214774407671269.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_043711_606565_ADFD6EBB 
X-CRM114-Status: UNSURE (   4.95  )
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

On 3/25/2022 6:45 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> wrote:
>
...
> I see new warnings in my regression tests:

Hi Kalle,

May I know what is your regression test do?

>
> [  755.217708] ath11k_pci 0000:06:00.0: failed to receive 11d scan complete: timed out
> [  794.641670] ath11k_pci 0000:06:00.0: failed to receive 11d scan complete: timed out
>
> Didn't investigate the patch in detail, gave up after seeing these warnings.
>
> Patch set to Changes Requested.
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
