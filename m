Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97ABC433EF
	for <ath11k@archiver.kernel.org>; Sat, 23 Apr 2022 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtjSIWO2r/A6erzUvgGTzipIQhXCw+lQ5G2/AxUqdmQ=; b=sj0gzLUMuaaMoX
	gPQszYvKXgtL+KXSGIvIV/sxpgzVwPjaWo2605wIGQ7EXRoikZtG1TznJSzVWkQ9eWqeGHFenvS2K
	dko282KBKY9pT4bubO1mtPd9JAL+Tpzeqhl0OSqoGCVmHjomvxcFxN/J2qJ1G0zFOtrTiGTD+Cvh9
	6Q/FGKzEim51Pa2lEGaRMsVryBaKjVvwan5BM2GZ1l/njCMCLshTkPTbgALbw2stiLKlCZyTSh4uV
	Lb0NzDzZkDPa1Mi43M2AKIw1sfSAhfF+IvvqOI18qVdiQqwYmpT7uryjPE3MAP9izFapyFVpu3r7Y
	XJlWD0qDKXsDiZqqeA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niC35-003uZy-Fq; Sat, 23 Apr 2022 09:27:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niC32-003uZN-Vi
 for ath11k@lists.infradead.org; Sat, 23 Apr 2022 09:27:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64EE6B806A0;
 Sat, 23 Apr 2022 09:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3603EC385A0;
 Sat, 23 Apr 2022 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650706042;
 bh=3H37Rzqk1FeYhFU0BDkTs02vxT4OQtbKSHd2qad04g4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=sBWG/lcaiH1iCoWYQ4E9dT/hgN77tKdFs7ZEzHVNPl74ed4+hajgstc8zxh1hQlos
 fZqit9Y/RoqvMNuOFe9lpVROVL739sNBlY2V1hcDM3mfJLBCEK3QH9EjIkqjwpHazP
 /c2o/PCS5dvw3z4rBbPWTF61rcJgnf/QaeMcqQ2V/A8c17psPYrsGTFQD8DDdsbHu2
 sxtkS3lzgqcs8JhsnJ0Q4mseonLXbtBpVJscBhR/t5aVcXGPt19CfuFSD9RxLhje2R
 BQbLUWazoySWOSviKTd10TNwspmIkH8Srwzh8Mfh/0/aAluZJaQu3PrRh8PjvWJWIU
 WbS5FEnBRntvA==
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] ath11k: add support for extended wmi service bit
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220401120948.1312956-2-quic_bqiang@quicinc.com>
References: <20220401120948.1312956-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165070603759.959.12335103712357746834.kvalo@kernel.org>
Date: Sat, 23 Apr 2022 09:27:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_022725_216378_FC58BA16 
X-CRM114-Status: GOOD (  11.74  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> When the WMI service bits are reported from firmware they are divided into
> multiple segments, with 128 bits in each segment. The first segment is
> processed by ath11k_wmi_service_bitmap_copy(), the second segment is processed
> by ath11k_service_available_event() with WMI_TAG_SERVICE_AVAILABLE_EVENT. When
> the service bit exceed 256 bits, then firmware reports it by tag
> WMI_TAG_ARRAY_UINT32 in WMI_SERVICE_AVAILABLE_EVENTID.
> 
> Currently ath11k does not process the third segment. Upcoming features
> need to know if firmware support is available for the features, so add
> processing of the third segment.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

e2e23a791745 ath11k: add support for extended wmi service bit
652f69ed9c1b ath11k: Add support for SAR

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220401120948.1312956-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
