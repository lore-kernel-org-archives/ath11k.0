Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D99C433EF
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 19:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5JWsZnnh0SWN7Q7nFjEpK/Hgl5LvqcCM1qcG4hlGLs=; b=xh4uz8SMXHf9+qq0yGlnF5UBLa
	j4fWCNOOTMo35jQNkyUvFpYn5VoyIiGd49atjyFOoaJhBYcjhbR1qlSC41AkUdNO+Zw75XZunKlyl
	5ohSe5kic7UC7wd8Pk1eB7HWxqrWIBfKWFNldTF9bdE8kpOY3epGm1iHwAvEHelAn0nLvHdbocgDf
	IecD4sScb7SJS8HX/VBb5UQ54iLTaBvH+30quOUiyibW0ch/kv4EAo90zmxMQdffw6LCnPZDUztET
	sgm0U39Z6PqkZ+VctyTsSDnrjfiMtP1Kevfbq01s5okcOj+FAy66N5pCmZUTsfhy4enDACpe0pjFg
	8uFQ+pdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXpSU-0035on-T9; Fri, 25 Mar 2022 19:18:50 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXpSS-0035oT-LM
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 19:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648235928; x=1679771928;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bKj8TilLGdyVW9vS4DTruobfv+ddR2kfPYUpYlsH4ic=;
 b=uiJ40n8YToY8Q1nSuVp4Kf/57PsV2TKzO5SL+3rrWx/+lhlaeaK09af8
 j1SasihmHcmxjySp5uowuO/nN9KHnPezZWLSvBetg3OeCuV2TpURZblId
 /DjhiVphyVDcpvatrBxq+/ZwhU221Onyb+Et8vNEIcs7AJJb01faWv9+v 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 25 Mar 2022 12:18:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 12:18:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 25 Mar 2022 12:18:42 -0700
Received: from [10.110.27.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 25 Mar
 2022 12:18:42 -0700
Message-ID: <bca5ba81-7e97-9b54-be57-a40df9b0634c@quicinc.com>
Date: Fri, 25 Mar 2022 12:18:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/3] nl80211: Add support for beacon tx mode
Content-Language: en-US
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220325055949.3035053-1-quic_mkenna@quicinc.com>
 <20220325055949.3035053-2-quic_mkenna@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220325055949.3035053-2-quic_mkenna@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_121848_782245_B4094514 
X-CRM114-Status: UNSURE (   6.45  )
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

On 3/24/2022 10:59 PM, Maharaja Kennadyrajan wrote:
[...snip...]

> +/**
> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
> + * @NL80211_BEACON_STAGGERED_MODE: Used to configure beacon tx mode as
> + *	staggered mode. This is the default beacon tx mode.

Documentation doesn't match the code. There is now a default mode, and 
that is, well, the default mode

> + * @NL80211_BEACON_BURST_MODE: Used to configure beacon tx mode as burst mode.
> + */
> +enum nl80211_beacon_tx_mode {
> +	NL80211_BEACON_DEFAULT_MODE = 0,
> +	NL80211_BEACON_STAGGERED_MODE = 1,
> +	NL80211_BEACON_BURST_MODE = 2,
> +};
> +

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
