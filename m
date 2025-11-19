Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B66CF2597
	for <ath11k@archiver.kernel.org>; Wed, 19 Nov 2025 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a39qS9THoZoyW40hqoMxyri1LtTdUt2BE8ZMUdYz3xI=; b=1M64qrjoNPrc2j4qNloCD7CAXn
	OMLdGXz8tGnLyYt+lRO22guWDtQQcivKAaAWGHrLpwLAP/on2hhqNe2uvE1BMFjVPtZ8fV2fB8CFt
	BFibIMhNt7a+eYjsls0Z5oORPg9d9qIao+EgnCFbbzrsoG4yJJaZ6NJq/8Mb8ZFtXfQ1QxkJW+vQk
	s8ZAmQE+ilnLVSHYb0nu3xmP5QLe+kwMko7DgZwS5WXY3/DbzS7OppHlnnLK7tNksTBPhutR55yoQ
	e/NIBrRLV/+kIktNBF8xsGeGZEjIv8KybSc2GawLwpkDn8Ni5zqZUtQBie7RoXnPfDY1huXvyQhHc
	5vF1WYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdGK-00000002lbh-2Dxf;
	Wed, 19 Nov 2025 08:10:00 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdGH-00000002lax-3GsF
	for ath11k@lists.infradead.org;
	Wed, 19 Nov 2025 08:09:58 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3437ea05540so5920634a91.0
        for <ath11k@lists.infradead.org>; Wed, 19 Nov 2025 00:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763539797; x=1764144597; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a39qS9THoZoyW40hqoMxyri1LtTdUt2BE8ZMUdYz3xI=;
        b=VfMpLmGWVTxYPZaudrie17/iifh+Cx7JON036nm52635CHdY1gEiOqGanADWL1N3Cs
         9Hju/PtrRx5bZCuenP6TNltzU6gbFpKQskiq/UwtpxtOW0GvoiVD2ZUu/TIvDzGBcIR0
         h8UhSYFCwHImUabiMvPdN0HFvMjdg098UyoXF936zhMgYNIzQHsGFuuKYYJ0y6bbfCgt
         oUEu8b0ooUiQFgHMo4z0KcLguVOyhCcPYPnK5VegVpwcwXf3U3Uv3Psqmd33peaJxhl0
         qizpIAp44nniNcRZyL9BvjgqtiJO92tK1ogacR+0bE1uO7oZFW9lsfNZo0NVx5Nd34W6
         alxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539797; x=1764144597;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a39qS9THoZoyW40hqoMxyri1LtTdUt2BE8ZMUdYz3xI=;
        b=Sf8zu1GklAEGQteEzq22QeCylCzjDzNA0DJbHGYqGNiRvQU81pVbJp3DELJVVcqNGp
         gzZg0GG2g+pcKaZDnb3HyZByzRfkpxQuQ5uQD5p9Qo9k3RR1hPaVbfvZsI6nVCuZ/DCX
         GuzHy1YArT9hpgbZHnpClJm4TaCixRFhwG8yu/XUoNcVGxcwVey+YkQGxbGTI7bNUJIu
         kW+iri1b17W9h9Kpr447m7czLWtcoAC5VK+bG7O1/FNB+QxZR1ChyJHprUiQb7ctE7Hp
         R3rDnQldPUTVEKKhuzxRXsne4teiu0a2gYOslat8IB3v6Y8l5tJxIHyOk9RR+g3fOeZi
         S6qw==
X-Gm-Message-State: AOJu0YyrxeoTIB/JZThCpR/UXkv85EdzhOjpS3yW1pjOmEQSGAhqGJua
	NaxD8mvJDuuO5JXtT89zgXJbIBRg+LXdbs3ViVF2ViqvabpdGnGLzzongt+s3/4uIhvUcmdJ315
	b4TjEkY+rFjvvJy9zcFu5z4lHzw8BKw==
X-Gm-Gg: ASbGncuRxlQDX+tidox7bj1EjrWidBRLsHz1/A1nivuRErUyx21yic0F7vCOgfM25S0
	Y1JNduY8QqHcB12yKV6VCa/ERRHyS6cWgYRDUI2tjAIghUxo9PtjuDq9YqD7RS/bTJ62qVzdZwC
	Y41G5UL9O5NqttL1gZlIxjaShNsg+p8ZJFTdYgzKl8Db5Wrw8kAcde3rcdb6VZcnoKR4FXLopKp
	PQLxYkmg/6lbxqnsyCRVtgPE51R/ylgIBE+dLd5xd0+fX5nF9gp8+vA5iUDu0fBvV/mgmk28WJq
	f84=
X-Google-Smtp-Source: AGHT+IGRwjPAZWI/LkmCbmFjssIGAPewHIFhCSWpNS3Ld2uk5GBPL1IBVqYl8F3Cww50AryvRZGDWVS+bLrBXzVMrm4=
X-Received: by 2002:a17:90b:2244:b0:32e:7c34:70cf with SMTP id
 98e67ed59e1d1-343fa754977mr21837353a91.36.1763539796542; Wed, 19 Nov 2025
 00:09:56 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Date: Wed, 19 Nov 2025 09:09:44 +0100
X-Gm-Features: AWmQ_bl44G0Px-nO8xsutIR7OZVzuzXJR2Pttj_Gy95HLVR9iwbtIHW4E_siwJM
Message-ID: <CAKEyCaD8RMqPvwZOxgwAT4G=h-M94ToxoSdYwCjfvZMiM8mB-g@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
To: quic_yuzha@quicinc.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_000957_818574_1CA93EC2 
X-CRM114-Status: UNSURE (   4.29  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

After this change, IPQ8074 crashes in STA mode:

[  165.110962] qcom-q6v5-wcss-pil cd00000.q6v5_wcss: fatal error received:
[  165.110962] QC Image Version:
QC_IMAGE_VERSION_STRING=WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
[  165.110962] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.eval_v2Q
[  165.110962]
[  165.110962] wal_tx_control.c:823 Assertion 0 failedparam0 :zero,
param1 :zero, param2 :zero.
[  165.110962] Thread ID      : 0x00000062  Thread name    : WLAN RT1
Process ID     : 0
[  165.110962] Register:
[  165.110962] SP : 0x4bfd5ce8
[  165.110962] FP : 0x4bfd5cf0
[  165.110962] PC : 0x4b107f58
[  165.110962] SSR : 0x00000008
[  165.110962] BADVA : 0x00020000
[  165.110962] LR : 0x4b1076f4
[  165.110962]
[  165.110962] Stack Dump
[  165.110962] from : 0x4bfd5ce8
[  165.110962] to   : 0x4bfd62c0
[  165.110962]
[  165.157843] remoteproc remoteproc0: crash detected in
cd00000.q6v5_wcss: type fatal error
[  165.180083] remoteproc remoteproc0: handling crash #1 in cd00000.q6v5_wcss
[  165.188416] remoteproc remoteproc0: recovering cd00000.q6v5_wcss
[  165.221076] remoteproc remoteproc0: stopped remote processor
cd00000.q6v5_wcss
[  165.485399] ath11k c000000.wifi: failed to send WMI_PEER_SET_PARAM cmd
[  165.485443] ath11k c000000.wifi: failed to setup peer SMPS for vdev 0: -108
[  165.490829] ath11k c000000.wifi: Failed to send WMI_TWT_ENABLE_CMDID
[  165.497736] ath11k c000000.wifi: Failed to send
WMI_BSS_COLOR_CHANGE_ENABLE_CMDID
[  165.504283] ath11k c000000.wifi: failed to enable bss color change
on vdev 0: -108
[  165.511671] ath11k c000000.wifi: Failed to send
WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID
[  165.519136] ath11k c000000.wifi: failed to set bss color collision
on vdev 0: -108

Regards,

