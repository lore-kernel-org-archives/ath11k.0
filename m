Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6BC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZI4NryZ8qmOR30Y8lPa7QNkSrsBFnfva9S5HmCe+60=; b=MqFFMtcYE48Ja+
	4yaiZ6E6D1Y6ZW0SwzHi4I8jxjEvkv8bPLX9XlbYhvHicoU7Ip4FZip0WhDjRxS5QjyN0Q7G5X+gt
	RhrN7B1apFBAuMs/VA4aoyvK6Bg48HF2KD7Jc63p4/BYzh0gcs7m1nNI8e5TDJOk+6aWoaD+VcHdQ
	Uw3k+vew38X59O4lkWbyZeuGAn/WUYMWV29WsEPIRpWLMMMejHuZUyfRAvIzv2pKYzEW6hJR828Na
	2BYwlSqZ4jt9p8lGSNWxoQHAjHBRj3mZmuDekD+3AFRsW3GF22up3oe4pTMA3sdwp56vAN+QZS6tR
	+Xxq3NIpBmMY3vScibQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvM6G-00GeZO-Vf; Thu, 09 Dec 2021 16:16:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvM6E-00GeYr-4s
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 16:16:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 95534CE26FF;
 Thu,  9 Dec 2021 16:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492DAC341C3;
 Thu,  9 Dec 2021 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639066605;
 bh=vIafIP6C3RpogBuFFp1t3jgJ2dzSziVrRC/XH3biL8c=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=GcfEwhKmiTJvQQ5Y0fKoT15Y9A1t0xqh1GG/ENdGwU9mE6DeNp2c1AKkVoGzrikw9
 4cMeyUhadDPh8QmpDaiqHmAjLbend0c40d/M7yyi2CaRd5oj/0sqxITMoJty6SbTol
 ZdIVG3uoflGskKwkMcdMFqm81zmMXPaDQMd9LhZHxh9/6lteI7DadFvnTESmNpC6pR
 iKQx5XXfomA+zjCwPWXKnl8Rfdkz1o0mRZsarR1Uf4XIvJWIPlmsxt5ywVRpMWqc4s
 HOdEWEcjuxosrmqJhy1rAQNDiZ3Qm4zMbRNl7ylVTiRS0Vkt3XAqrIf6YyZIoJZ8uW
 OtFl7RxGn+OlA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 01/15] ath11k: add support for extended wmi service bit
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
 <20211026111913.7346-2-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 18:16:41 +0200
In-Reply-To: <20211026111913.7346-2-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:18:59 -0400")
Message-ID: <87fsr1wy6u.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_081650_392919_E35A4F65 
X-CRM114-Status: GOOD (  12.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> writes:

> The max wmi service bit is 256 in ath11k, Extend it
> for more wmi service bit.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -2059,7 +2059,9 @@ enum wmi_tlv_service {
>  	WMI_TLV_SERVICE_EXT2_MSG = 220,
>  	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
>  
> -	WMI_MAX_EXT_SERVICE
> +	WMI_MAX_EXT_SERVICE = 256,
> +
> +	WMI_MAX_EXT2_SERVICE
>  };
>  
>  enum {
> @@ -5066,7 +5068,7 @@ struct ath11k_wmi_base {
>  
>  	struct completion service_ready;
>  	struct completion unified_ready;
> -	DECLARE_BITMAP(svc_map, WMI_MAX_EXT_SERVICE);
> +	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);

I don't get this, why do we need two MAX enums? Please explain in the
commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
