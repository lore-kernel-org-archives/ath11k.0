Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89795C4167B
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 22:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9iPAvEFNJGpOrrJWeJh2QzFdOmCrNjBGjwFY7ex16E=; b=czkIxgJ/7jNLMo
	nSk/Ygr7+XJ30A6uqWGpAPhT4HSFRjKObzDR/yZO0TlWAQczOr4mGRFyR1TsDf7hXkzMcVOKJNd7I
	CnolfUOpUBE1Hk0LU3JwP0nMA8IKiZgyQxRic/1dYf9tFrkkI4KJwk3bF0swZ54mhBeELpHHbk3/g
	CtBJyittwi6mxegl7oJLt1Gr0NcG7eHRuAFBVq4byHHp8G8Ixpk59CLYnWge1BzW/JGv0XkXxbeVD
	xiSGTKVnHCBNRXhKXU90OFU7qfbwpCW4NonESg6miOZGmTKJoxmOYGCVMyfuzOgWQEVdCF5Lkot3y
	ZySmXXHkhnwIMK5M/z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7kUh-003cqo-1Z;
	Mon, 27 Nov 2023 22:54:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7kUe-003cpu-14
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 22:54:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-332e3ad436cso2920924f8f.3
        for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 14:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701125658; x=1701730458; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIZZjVzYyIfXfJZDLrm8sokZX3uH1Dv9Mf0lFv/fkno=;
        b=EHTiOzmP9rGlWxBcdo/srCZyErr4LN5DdeEr2cnkT3ElVov8TP4sZ9UBKhoNsqddoG
         cvRlOLs+3oty1lL/KFCVdCbmLzTLP5x2kypq3BRDVLm/GUEMYfTiIhdnkTEj8L3WZfc3
         LiYZC49ZOFiafsRpHjAAkjWhN/cwAB/Z4gmwGgf5Gces6wdadCi0HKrztqjs3Nt+trrl
         r5splwricNKbz53ToS4fBDeNNF6fqhNDbmd87bEYz04BVrwp0VsnniV2oGi7pCj+h6fQ
         ZbohV5lu2L9glct7L48PpEzxMYnyFhwEsjcPupT+8MAAPxk4UEk8o1RXQLmBk3qrDd+f
         U8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701125658; x=1701730458;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QIZZjVzYyIfXfJZDLrm8sokZX3uH1Dv9Mf0lFv/fkno=;
        b=elCOZwhi88AUjebwhS3Qw+yTsWU0UbhdfP5xuopJM4iWfNvDKe37eUgsgLdmXcAq6x
         gsHTe4814QwOsEDyu1EcxVjEAjH2SvJHx+u0bl9OaXeQ0Z/+pa1xvTh2uJCu+5EMFIpk
         IvU0KDzGxJp0mQpsq0ZKQqpoyuzPiRa+fFuwXV5oKqqM1aOL218L9vaPGGolfDZVwC5h
         IUE1qjaJpWnT5h6PNDQ/EGYPcAVOMRFuLd3WPLVTFhcet9cz2oKRRZc/l8+249WULiBT
         AayNw/Atw3SnYQFzvD+RaH2yfYJZGOS8dwg9m3CN2l7X1QVskdbJYD2utE/e5uldq4Jg
         tNTA==
X-Gm-Message-State: AOJu0YyfbKOJC665QuVHdBAq0l3N7csYWc9hHXoLi37OCklpOTlcP0Gz
	Pf7m2XoDotNcTHeyiPCf13w=
X-Google-Smtp-Source: AGHT+IEOptO9tc+DnBiK8/x4iOCPqjUwNymCAFCsQEo5iBKNgEhWeaNKzV748GEliI/QGLFHM8rUoQ==
X-Received: by 2002:a5d:6352:0:b0:332:d360:5df5 with SMTP id b18-20020a5d6352000000b00332d3605df5mr8416414wrw.54.1701125657881;
        Mon, 27 Nov 2023 14:54:17 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c138c00b004063c9f68f2sm15238589wmf.26.2023.11.27.14.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 14:54:17 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 27 Nov 2023 23:54:17 +0100
Message-Id: <CX9YPUDTAT1N.23DMRB5O9FEAO@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>, "Kalle Valo"
 <kvalo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231127180559.1696041-1-nico.escande@gmail.com>
 <bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
In-Reply-To: <bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_145420_372218_BA54598C 
X-CRM114-Status: GOOD (  29.49  )
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

On Mon Nov 27, 2023 at 7:38 PM CET, Jeff Johnson wrote:
> On 11/27/2023 10:05 AM, Nicolas Escande wrote:
> > The is a layout mismatch between the bitfield representing scan_flags in
> > struct scan_req_params & the bits as defined in the WMI_SCAN_XXX macros.
> > Lets fix it by making the struct match the #defines.
> > 
> > I tried to correct it by making the struct match the #define and it 
> > worked for WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS / scan_f_force_active_dfs_chn
> > so I'm assuming this is the right thing to do.
> > 
> > Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> > 
> > Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/wmi.h | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> > index 100bb816b592..0b4e6c2f7860 100644
> > --- a/drivers/net/wireless/ath/ath11k/wmi.h
> > +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> > @@ -3348,17 +3348,17 @@ struct scan_req_params {
> >  			    scan_f_filter_prb_req:1,
> >  			    scan_f_bypass_dfs_chn:1,
> >  			    scan_f_continue_on_err:1,
> > +			    scan_f_promisc_mode:1,
> > +			    scan_f_force_active_dfs_chn:1,
> > +			    scan_f_add_tpc_ie_in_probe:1,
> > +			    scan_f_add_ds_ie_in_probe:1,
> > +			    scan_f_add_spoofed_mac_in_probe:1,
> >  			    scan_f_offchan_mgmt_tx:1,
> >  			    scan_f_offchan_data_tx:1,
> > -			    scan_f_promisc_mode:1,
> >  			    scan_f_capture_phy_err:1,
> >  			    scan_f_strict_passive_pch:1,
> >  			    scan_f_half_rate:1,
> >  			    scan_f_quarter_rate:1,
> > -			    scan_f_force_active_dfs_chn:1,
> > -			    scan_f_add_tpc_ie_in_probe:1,
> > -			    scan_f_add_ds_ie_in_probe:1,
> > -			    scan_f_add_spoofed_mac_in_probe:1,
> >  			    scan_f_add_rand_seq_in_probe:1,
> >  			    scan_f_en_ie_whitelist_in_probe:1,
> >  			    scan_f_forced:1,
>
> You are convoluting two different data structures.

So maybe I'm missing something and please correct me where I'm wrong.

> struct scan_req_params is used to represent a scan request within the
> host driver. This does not use the WMI_SCAN_XXX macros.
>

In mac.c when we start a scan with ath11k_mac_op_hw_scan() for example we first
initialize a struct scan_req_params with ath11k_wmi_start_scan_init().
ath11k_wmi_start_scan_init() by itself does use the WMI_SCAN_XXX macros

	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;

Then later on in ath11k_mac_op_hw_scan() we either use the bitfield like with

	arg->scan_f_add_spoofed_mac_in_probe = 1;

or we directly modify scan_flags like with

	arg->scan_flags |= WMI_SCAN_FLAG_PASSIVE;

So is it not expected to use those flags there ?

> struct wmi_start_scan_cmd is used to represent the scan request command
> sent to firmware. This struct uses the WMI_SCAN_XXX macros to fill some
> members of this struct in ath11k_wmi_copy_scan_event_cntrl_flags().

Indeed ath11k_wmi_copy_scan_event_cntrl_flags() copies from struct
scan_req_params to struct wmi_start_scan_cmd but this time we do not use 
scan_flags directly, only ever use the bitfield that is in the same union
as scan_flags

So having the bitfield out of sync does cause the struct wmi_start_scan_cmd that
gets sent to the driver to not reflect the desired state set in scan_req_params.

> So your change has no effect on the driver operation and incorrectly
> tries to foist the firmware definition upon the host internal
> representation.

So either we should not use WMI_SCAN_XXX with scan_req_params.scan_flags ever
and only use the bitfield to set scan parameters or if we use WMI_SCAN_XXX with
scan_req_params.scan_flags they need to match the corresponding bitfield.

>
> So NAK to this patch.
>
> /jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
