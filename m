Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ABAE78499
	for <ath11k@archiver.kernel.org>; Wed, 24 Dec 2025 21:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTWNttZGcaoPC4e1j/utiv4zbSB6TRNZbwodr2K9LRg=; b=e+Y7321LyVET2JERmjPuh+yM2V
	rRppgReQei0VrTqfVQhGaTHE+Pyf8ESL6uj7LpXD8k96BOtC5bfaQnjFJE8lc+ZD29wC5ihKA/O7q
	UxrYGISmqqaEw9Sj5r85bszHtw2z8lwnJe7H/YkRYpsaQdhLB9WhfeHCJ/+xXvvJs+ms88hwCSH+3
	4TveCO7Ix2z5ybOjkgNFJR5te5yaMIumNezVKZPLvJ73v2K64ZZiJEouOpUs9WYkPYqB70goCkeFi
	ty1nDMdk57EpwoDOACeqV7shISl0smRBaCqDmI1PtW9wrci5ie6T/HFvzC7SZIzU1xJ1qnTbEHD1I
	utvBaWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYWo0-0000000HQvi-34ZZ;
	Wed, 24 Dec 2025 21:54:04 +0000
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYWny-0000000HQum-1uJS
	for ath11k@lists.infradead.org;
	Wed, 24 Dec 2025 21:54:04 +0000
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-7881b67da53so51832207b3.1
        for <ath11k@lists.infradead.org>; Wed, 24 Dec 2025 13:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766613241; x=1767218041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTWNttZGcaoPC4e1j/utiv4zbSB6TRNZbwodr2K9LRg=;
        b=f3CvKVuxz2uLmqTEX/owjy/UbEvZ7nwZuLaz+kn3Z5k4/mtjbcHXtpbvAQUyM5h5ti
         HHEcLkSW8Q043mzVZlbctMOj/jeyBEDB3FuEdcSedAQGJT3vrF9XtMmeJuVoFiJS9X5V
         Qp83Pn2wtsf/EowkXRXqEmKGNowrcOMcxD3ntM5WruTx/avtU9+H6Gw4+UvC2d7KmdHl
         h9GAbymPWuIMSb5A767HjhTpqktTupJZ5YNGFq6dzuQ6tbJvBuT56QcruEa6ySdEE2XK
         BxWknoiZI7/sNix9IaLeGRcT1U+MajQv7JFzwef4SuOYjhNkYiST5Ehe0EPd3B+ulvak
         NLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766613241; x=1767218041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTWNttZGcaoPC4e1j/utiv4zbSB6TRNZbwodr2K9LRg=;
        b=gyqLpreA0VHk8wAKWidOmpyG+1vsK5EJm+uetnunUR26zj+2mQeOIzgk4q+Dozai/C
         XMaczqYZIEgNM4s5UTa2ks8qW4eXeikxs2sqS0n61Zmgrvfg+hJRFrPl3eQwdlzMMEwY
         MXkaAXKaVLvHEvomndggKc3rNdaNGelKG+58+jNtPcFjYZkn87Grq5tspo1mOKrRLMdm
         01sg8niov77n3EoZ9Lrq7w8Q7fusCRs1uZgD9MH4u5EZXqc2F2ausF3O+M9bF6FAh6YW
         dIvFXKfLJe2LCkBpzPPh+rePl9jHeCVzoScIs/HKiDDK2pRZhMvd0NizsvV4QX19UknX
         ndMA==
X-Gm-Message-State: AOJu0YylWF+QSHirhTg+5ggU5jSJZpx65gfujj7STnRZhi7JDPO+rFVD
	9zvkw1B02gM0bf+SAfOsf+sjHBQ6Zo3ESyufGuEFoE0kiGXqNL63rPoMu8yQgoHF
X-Gm-Gg: AY/fxX4uQHacXPT3xOm9NHQRrrY95sY8jt8jTtX79UQwSfUWak4JvF7RrascbcnotV5
	Pu3BkXpSC58cKLONInvV/K8xT3G/f0v6Y9J05PIOZpOA5nciwM+9EK1v4AVJsjElY+g26Erqh6m
	/wuVR65FvVeWEy2dp4AREd2P6t82s0fCzVnrc9dSzbjyTDnFxdjiXr+CEOPuoq4XCHJo/p7CM1W
	lZGSA63bz3jqRL+nbHV2n1249qntf+BZsrswmh5WhmkJuSNMBCwQB3d8niJ2pJk8OQTAxQsr24l
	+mjT5gKfcrA9mNx8dJ/c+cQdgloLtye+0HMX8+WVuyxYp3iD/1OmOHCF1/Ha70krkJgHyBKvj0a
	AL6P9CPac+OXUAZ1xraVNc5fX/n39Rwxh6AK+FH1fIZm6Wod7GnBlNbOSFKtf10A745DhXi+dAa
	74L1Z39A4SwpOhACCfvSAVObRFDuLk26t5CanyevZHPMQSwmEy+CqsJiwheCeAzxdtBhNH9xByO
	ppjwstXCfVSVn1+Xh2SCwO2hPgL/AM=
X-Google-Smtp-Source: AGHT+IFtS5CRBe4+CFpf0UsLdfArJUYMurpeS1NNo46ug0+dk8xpSG9mCbqy9e8AJspTPNqIYDfYYQ==
X-Received: by 2002:a05:690c:7403:b0:78d:6a71:76c5 with SMTP id 00721157ae682-78fb3efa0ffmr155097187b3.10.1766613240637;
        Wed, 24 Dec 2025 13:54:00 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43782bfsm69238267b3.5.2025.12.24.13.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 13:54:00 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
Date: Wed, 24 Dec 2025 15:53:59 -0600
Message-ID: <3484871.yKVeVyVuyW@nukework.gtech>
In-Reply-To: <83c5bb41-ac0f-4f01-be38-ba536dc8b977@oss.qualcomm.com>
References: <20251216043555.628296-1-mr.nuke.me@gmail.com>
 <83c5bb41-ac0f-4f01-be38-ba536dc8b977@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_135402_607936_1F66C00E 
X-CRM114-Status: GOOD (  31.96  )
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

On Tuesday, December 16, 2025 1:14:27 AM CST Baochen Qiang wrote:
> On 12/16/2025 12:35 PM, Alexandru Gagniuc wrote:
> > ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> > is initialized in, core.c, a different file than the array. This
> > spaghetti-like relation is fragile and not obvious. Accidentally
> > setting ".max_tx_ring" too high leads to a hard to track out-of-
> > bounds access and memory corruption.
> >=20
> > There is a small ambiguity on the meaning of "max_tx_ring":
> >  - The highest ring, max=3D3 implies there are 4 rings (0, 1, 2, 3)
> >  - The highest number to use for array indexing (there are 3 rings)
> >=20
> > Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> > ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
> > instead of #defines to initialize the length field.
> >=20
> > The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
> > so use a constant to express the correct value. Add a static_assert()
> > to fail compilation if the constant is accidentally set too high.
> >=20
> > The intent is to make the code easier to understand rather than fix
> > an existing bug.
> >=20
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > ---
> >=20
> > I am trying to make ath11k work on IPQ9574. My device uses a IPQ9570
> > with a QCN5024 as the 2.4 GHz wifi.
> >=20
> > I spent a few days tracking a memory corruption bug caused by
> > erroneously setting ".max_tx_ring" too high. I think I would not have
> > made this mistake if the initializations of .max_tx_ring and
> > .tcl2wbm_rbm_map were right next to each other.
> >=20
> > Changes since v1:
> >  - use "num_tx_rings" name instead of "map_len"
> >  - make sure debugfs.c is correctly updated
> >  - add a static_assert for ath11k_hw_hal_params_qca6390 special case
> > =20
> >  drivers/net/wireless/ath/ath11k/core.c    | 12 +-----------
> >  drivers/net/wireless/ath/ath11k/debugfs.c |  2 +-
> >  drivers/net/wireless/ath/ath11k/dp.c      | 12 ++++++------
> >  drivers/net/wireless/ath/ath11k/dp_tx.c   |  9 +++++----
> >  drivers/net/wireless/ath/ath11k/hw.c      | 19 +++++++++++++++++++
> >  drivers/net/wireless/ath/ath11k/hw.h      |  3 ++-
> >  drivers/net/wireless/ath/ath11k/mac.c     |  2 +-
> >  7 files changed, 35 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c
> > b/drivers/net/wireless/ath/ath11k/core.c index
> > 812686173ac8a..07199ceecbeb4 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -100,7 +100,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D false,
> >  		.fix_l1ss =3D true,
> >  		.credit_flow =3D false,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_ipq8074,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D true,
> >=20
> > @@ -184,7 +183,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D false,
> >  		.fix_l1ss =3D true,
> >  		.credit_flow =3D false,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_ipq8074,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D true,
> >=20
> > @@ -271,7 +269,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D false,
> >  		.fix_l1ss =3D true,
> >  		.credit_flow =3D true,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX_QCA6390,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_qca6390,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D false,
> >=20
> > @@ -358,7 +355,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D false,
> >  		.fix_l1ss =3D true,
> >  		.credit_flow =3D false,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_ipq8074,
> >  		.supports_dynamic_smps_6ghz =3D true,
> >  		.alloc_cacheable_memory =3D true,
> >=20
> > @@ -445,7 +441,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D true,
> >  		.fix_l1ss =3D false,
> >  		.credit_flow =3D true,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX_QCA6390,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_qca6390,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D false,
> >=20
> > @@ -533,7 +528,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D true,
> >  		.fix_l1ss =3D false,
> >  		.credit_flow =3D true,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX_QCA6390,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_qca6390,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D false,
> >=20
> > @@ -619,7 +613,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D true,
> >  		.fix_l1ss =3D false,
> >  		.credit_flow =3D true,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_wcn6750,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D false,
> >=20
> > @@ -662,7 +655,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.qmi_service_ins_id =3D=20
ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
> >  		.ring_mask =3D &ath11k_hw_ring_mask_ipq8074,
> >  		.credit_flow =3D false,
> >=20
> > -		.max_tx_ring =3D 1,
> >=20
> >  		.spectral =3D {
> >  	=09
> >  			.fft_sz =3D 2,
> >  			.fft_pad_sz =3D 0,
> >=20
> > @@ -698,7 +690,7 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D false,
> >  		.idle_ps =3D false,
> >  		.supports_suspend =3D false,
> >=20
> > -		.hal_params =3D &ath11k_hw_hal_params_ipq8074,
> > +		.hal_params =3D &ath11k_hw_hal_params_ipq5018,
> >=20
> >  		.single_pdev_only =3D false,
> >  		.coldboot_cal_mm =3D true,
> >  		.coldboot_cal_ftm =3D true,
> >=20
> > @@ -789,7 +781,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D true,
> >  		.fix_l1ss =3D false,
> >  		.credit_flow =3D true,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX_QCA6390,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_qca6390,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D false,
> >=20
> > @@ -876,7 +867,6 @@ static const struct ath11k_hw_params
> > ath11k_hw_params[] =3D {>=20
> >  		.supports_regdb =3D true,
> >  		.fix_l1ss =3D false,
> >  		.credit_flow =3D true,
> >=20
> > -		.max_tx_ring =3D DP_TCL_NUM_RING_MAX_QCA6390,
> >=20
> >  		.hal_params =3D &ath11k_hw_hal_params_qca6390,
> >  		.supports_dynamic_smps_6ghz =3D false,
> >  		.alloc_cacheable_memory =3D false,
> >=20
> > diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c
> > b/drivers/net/wireless/ath/ath11k/debugfs.c index
> > 977f945b6e669..50f344803e8fd 100644
> > --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> > +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> > @@ -707,7 +707,7 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(str=
uct
> > file *file,>=20
> >  	len +=3D scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
> >  	len +=3D scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:
\n");
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++)
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++)
> >=20
> >  		len +=3D scnprintf(buf + len, size - len, "ring%d: %u\n",
> >  	=09
> >  				 i, soc_stats-
>tx_err.desc_na[i]);
> >=20
> > diff --git a/drivers/net/wireless/ath/ath11k/dp.c
> > b/drivers/net/wireless/ath/ath11k/dp.c index 56b1a657e0b0f..c940de28527=
6d
> > 100644
> > --- a/drivers/net/wireless/ath/ath11k/dp.c
> > +++ b/drivers/net/wireless/ath/ath11k/dp.c
> > @@ -344,7 +344,7 @@ void ath11k_dp_stop_shadow_timers(struct ath11k_base
> > *ab)>=20
> >  	if (!ab->hw_params.supports_shadow_regs)
> >  =09
> >  		return;
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++)
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++)
> >=20
> >  		ath11k_dp_shadow_stop_timer(ab, &ab-
>dp.tx_ring_timer[i]);
> >  =09
> >  	ath11k_dp_shadow_stop_timer(ab, &ab->dp.reo_cmd_timer);
> >=20
> > @@ -359,7 +359,7 @@ static void ath11k_dp_srng_common_cleanup(struct
> > ath11k_base *ab)>=20
> >  	ath11k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
> >  	ath11k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
> >  	ath11k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++) {
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
> >=20
> >  		ath11k_dp_srng_cleanup(ab, &dp-
>tx_ring[i].tcl_data_ring);
> >  		ath11k_dp_srng_cleanup(ab, &dp-
>tx_ring[i].tcl_comp_ring);
> >  =09
> >  	}
> >=20
> > @@ -400,7 +400,7 @@ static int ath11k_dp_srng_common_setup(struct
> > ath11k_base *ab)>=20
> >  		goto err;
> >  =09
> >  	}
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++) {
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
> >=20
> >  		tcl_num =3D ab->hw_params.hal_params-
>tcl2wbm_rbm_map[i].tcl_ring_num;
> >  		wbm_num =3D ab->hw_params.hal_params-
>tcl2wbm_rbm_map[i].wbm_ring_num;
> >=20
> > @@ -782,7 +782,7 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
> >=20
> >  	int i, j;
> >  	int tot_work_done =3D 0;
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++) {
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
> >=20
> >  		if (BIT(ab->hw_params.hal_params-
>tcl2wbm_rbm_map[i].wbm_ring_num) &
> >  	=09
> >  		    ab->hw_params.ring_mask->tx[grp_id])
> >  		=09
> >  			ath11k_dp_tx_completion_handler(ab, i);
> >=20
> > @@ -1035,7 +1035,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
> >=20
> >  	ath11k_dp_reo_cmd_list_cleanup(ab);
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++) {
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
> >=20
> >  		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
> >  		idr_for_each(&dp->tx_ring[i].txbuf_idr,
> >  	=09
> >  			     ath11k_dp_tx_pending_cleanup, ab);
> >=20
> > @@ -1086,7 +1086,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
> >=20
> >  	size =3D sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++) {
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
> >=20
> >  		idr_init(&dp->tx_ring[i].txbuf_idr);
> >  		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
> >  		dp->tx_ring[i].tcl_data_ring_id =3D i;
> >=20
> > diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c
> > b/drivers/net/wireless/ath/ath11k/dp_tx.c index
> > 562aba66582f3..86e1e6c27b36c 100644
> > --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> > +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> > @@ -91,6 +91,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif
> > *arvif,>=20
> >  	struct hal_srng *tcl_ring;
> >  	struct ieee80211_hdr *hdr =3D (void *)skb->data;
> >  	struct dp_tx_ring *tx_ring;
> >=20
> > +	size_t num_tx_rings =3D ab->hw_params.hal_params->num_tx_rings;
> >=20
> >  	void *hal_tcl_desc;
> >  	u8 pool_id;
> >  	u8 hal_ring_id;
> >=20
> > @@ -113,7 +114,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_v=
if
> > *arvif,>=20
> >  tcl_ring_sel:
> >  	tcl_ring_retry =3D false;
> >=20
> > -	ti.ring_id =3D ring_selector % ab->hw_params.max_tx_ring;
> > +	ti.ring_id =3D ring_selector % num_tx_rings;
> >=20
> >  	ti.rbm_id =3D
> >  	ab->hw_params.hal_params->tcl2wbm_rbm_map[ti.ring_id].rbm_id;
> >  =09
> >  	ring_map |=3D BIT(ti.ring_id);
> >=20
> > @@ -126,7 +127,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_v=
if
> > *arvif,>=20
> >  	spin_unlock_bh(&tx_ring->tx_idr_lock);
> >  =09
> >  	if (unlikely(ret < 0)) {
> >=20
> > -		if (ring_map =3D=3D (BIT(ab->hw_params.max_tx_ring) - 1) ||
> > +		if (ring_map =3D=3D (BIT(num_tx_rings) - 1) ||
> >=20
> >  		    !ab->hw_params.tcl_ring_retry) {
> >  		=09
> >  			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
> >  			return -ENOSPC;
> >=20
> > @@ -244,8 +245,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_v=
if
> > *arvif,>=20
> >  		 * checking this ring earlier for each pkt tx.
> >  		 * Restart ring selection if some rings are not checked=20
yet.
> >  		 */
> >=20
> > -		if (unlikely(ring_map !=3D (BIT(ab-
>hw_params.max_tx_ring)) - 1) &&
> > -		    ab->hw_params.tcl_ring_retry && ab-
>hw_params.max_tx_ring > 1) {
> > +		if (unlikely(ring_map !=3D (BIT(num_tx_rings)) - 1) &&
> > +		    ab->hw_params.tcl_ring_retry && num_tx_rings > 1) {
> >=20
> >  			tcl_ring_retry =3D true;
> >  			ring_selector++;
> >  	=09
> >  		}
> >=20
> > diff --git a/drivers/net/wireless/ath/ath11k/hw.c
> > b/drivers/net/wireless/ath/ath11k/hw.c index caa6dc12a790b..bbaacdf76af=
0a
> > 100644
> > --- a/drivers/net/wireless/ath/ath11k/hw.c
> > +++ b/drivers/net/wireless/ath/ath11k/hw.c
> > @@ -2707,6 +2707,14 @@ const struct ath11k_hw_regs wcn6750_regs =3D {
> >=20
> >  	.hal_reo1_misc_ctl =3D 0x000005d8,
> > =20
> >  };
> >=20
> > +static const struct ath11k_hw_tcl2wbm_rbm_map
> > ath11k_hw_tcl2wbm_rbm_map_ipq5018[] =3D { +	{
> > +		.tcl_ring_num =3D 0,
> > +		.wbm_ring_num =3D 0,
> > +		.rbm_id =3D HAL_RX_BUF_RBM_SW0_BM,
> > +	},
> > +};
> > +
> >=20
> >  static const struct ath11k_hw_tcl2wbm_rbm_map
> >  ath11k_hw_tcl2wbm_rbm_map_ipq8074[] =3D {> =20
> >  	{
> >  =09
> >  		.tcl_ring_num =3D 0,
> >=20
> > @@ -2822,19 +2830,30 @@ const struct ath11k_hw_regs ipq5018_regs =3D {
> >=20
> >  	.hal_wbm1_release_ring_base_lsb =3D 0x0000097c,
> > =20
> >  };
> >=20
> > +const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018 =3D {
> > +	.rx_buf_rbm =3D HAL_RX_BUF_RBM_SW3_BM,
> > +	.tcl2wbm_rbm_map =3D ath11k_hw_tcl2wbm_rbm_map_ipq5018,
> > +	.num_tx_rings =3D ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018),
> > +};
> > +
> >=20
> >  const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 =3D {
> > =20
> >  	.rx_buf_rbm =3D HAL_RX_BUF_RBM_SW3_BM,
> >  	.tcl2wbm_rbm_map =3D ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> >=20
> > +	.num_tx_rings =3D ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074),
> >=20
> >  };
> > =20
> >  const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 =3D {
> > =20
> >  	.rx_buf_rbm =3D HAL_RX_BUF_RBM_SW1_BM,
> >  	.tcl2wbm_rbm_map =3D ath11k_hw_tcl2wbm_rbm_map_ipq8074,
> >=20
> > +	.num_tx_rings =3D DP_TCL_NUM_RING_MAX_QCA6390,
> >=20
> >  };
> >=20
> > +static_assert(ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq8074) >=3D
> > DP_TCL_NUM_RING_MAX_QCA6390); +
>=20
> instead of keeping this special handling, how about define its own
> tcl2wbm_rbm_map for ath11k_hw_hal_params_qca6390=EF=BC=9For even simply u=
se the
> newly introduced ath11k_hw_tcl2wbm_rbm_map_ipq5018? like
>=20
> const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390 =3D {
> 	.rx_buf_rbm =3D HAL_RX_BUF_RBM_SW1_BM,
> 	.tcl2wbm_rbm_map =3D ath11k_hw_tcl2wbm_rbm_map_ipq5018,
> 	.num_tx_rings =3D ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_ipq5018)
> };

Sure, I will do it this way.

I am ready to submit the IPQ9574 support, and this patch is a dependency.=20
Should I include v3 of this patch in the IPQ9574 series, or submit v3=20
independently?

Alex

> >  const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750 =3D {
> > =20
> >  	.rx_buf_rbm =3D HAL_RX_BUF_RBM_SW1_BM,
> >  	.tcl2wbm_rbm_map =3D ath11k_hw_tcl2wbm_rbm_map_wcn6750,
> >=20
> > +	.num_tx_rings =3D ARRAY_SIZE(ath11k_hw_tcl2wbm_rbm_map_wcn6750),
> >=20
> >  };
> > =20
> >  static const struct cfg80211_sar_freq_ranges
> >  ath11k_hw_sar_freq_ranges_wcn6855[] =3D {>=20
> > diff --git a/drivers/net/wireless/ath/ath11k/hw.h
> > b/drivers/net/wireless/ath/ath11k/hw.h index 52d9f4c13b136..9db984ac432=
1c
> > 100644
> > --- a/drivers/net/wireless/ath/ath11k/hw.h
> > +++ b/drivers/net/wireless/ath/ath11k/hw.h
> > @@ -134,6 +134,7 @@ struct ath11k_hw_tcl2wbm_rbm_map {
> >=20
> >  struct ath11k_hw_hal_params {
> > =20
> >  	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
> >  	const struct ath11k_hw_tcl2wbm_rbm_map *tcl2wbm_rbm_map;
> >=20
> > +	size_t num_tx_rings;
> >=20
> >  };
> > =20
> >  struct ath11k_hw_params {
> >=20
> > @@ -198,7 +199,6 @@ struct ath11k_hw_params {
> >=20
> >  	bool supports_regdb;
> >  	bool fix_l1ss;
> >  	bool credit_flow;
> >=20
> > -	u8 max_tx_ring;
> >=20
> >  	const struct ath11k_hw_hal_params *hal_params;
> >  	bool supports_dynamic_smps_6ghz;
> >  	bool alloc_cacheable_memory;
> >=20
> > @@ -291,6 +291,7 @@ extern const struct ce_ie_addr
> > ath11k_ce_ie_addr_ipq5018;>=20
> >  extern const struct ce_remap ath11k_ce_remap_ipq5018;
> >=20
> > +extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq5018;
> >=20
> >  extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074;
> >  extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_qca6390;
> >  extern const struct ath11k_hw_hal_params ath11k_hw_hal_params_wcn6750;
> >=20
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> > b/drivers/net/wireless/ath/ath11k/mac.c index
> > 3276fe443502f..33ebe03380114 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -7392,7 +7392,7 @@ static void ath11k_mac_op_remove_interface(struct
> > ieee80211_hw *hw,>=20
> >  	idr_for_each(&ar->txmgmt_idr,
> >  =09
> >  		     ath11k_mac_vif_txmgmt_idr_remove, vif);
> >=20
> > -	for (i =3D 0; i < ab->hw_params.max_tx_ring; i++) {
> > +	for (i =3D 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
> >=20
> >  		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
> >  		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
> >  	=09
> >  			     ath11k_mac_vif_unref, vif);





