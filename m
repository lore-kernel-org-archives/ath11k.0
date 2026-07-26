Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD8AC531C9
	for <ath11k@archiver.kernel.org>; Sun, 26 Jul 2026 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OM2orbDlhm3YFBnFC23eCT4mEbL7eF4VVSgAozJISpc=; b=zo6J1cLQZ3LdrUl/H+8hqrFwAy
	QgURBkMmgXAuXJjhxid9S8YaaFmwH+L4qHJBmbu82XTuR/46r6adT9RmXxbnN8uvzvczM2ukVivYH
	zr9xGDj7eMuiQlckdwEIZVgtt9O3NqYD7RqEqElv5cO+mY7rt0gbtZamWWVRmbLJbJtdOPIkUclw+
	0URSGBGSUHIQqJpJeu9IQyCD4LhHKh7cvLjTZZ37eYlwJhN4x9l7tHxjm/vrgV6X4VM79ILRtbzJ9
	RzlAkO8mfFgSQ/L9z1QsYRzQhOTMNMtU5COuaWhGEYsTtUZrVaKoYhuByncLnnq1xkgGbnty6fh4U
	WHlQUe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo46Y-00000001W7R-0bTT;
	Sun, 26 Jul 2026 19:01:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo46W-00000001W74-2KCI
	for ath11k@lists.infradead.org;
	Sun, 26 Jul 2026 19:01:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH83xp1337091
	for <ath11k@lists.infradead.org>; Sun, 26 Jul 2026 19:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OM2orbDlhm3YFBnFC23eCT4mEbL7eF4VVSgAozJISpc=; b=Xr8lNFLnvxzkR+iy
	GI4sfS8o+cb5oCdIuAQvbkpkFIHauKzdfjbSNWEdu9r/h7MLzUlfOZTEWGBqbo6V
	JjOCV4j5co5OUrP2CO5YhFPkNtd5TYSVYRpo85xtXOYcnGjhMU1pHE6DetBLe8xt
	VwI5Jz3KoSCu3ifyqmMb8OgLbpWAPrwQ0VW2YUPnd/cZrgyMZhJeDI9mY+eVrJ/P
	LwKVv2749D1sIFFtoMtf9HKM2lrg3t7vFiQTQPoHR+gjyKnACQUxnzQ5PqbW9n/D
	gY9jhOFitUdFq00Y1Cd5LEgvbWQ+EBXk+QsjF9ygqMEgL2vjt2HVuNoyyWaZOt6S
	1aKlHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbgyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 26 Jul 2026 19:01:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfca8558d2so28434125ad.2
        for <ath11k@lists.infradead.org>; Sun, 26 Jul 2026 12:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785092498; x=1785697298; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OM2orbDlhm3YFBnFC23eCT4mEbL7eF4VVSgAozJISpc=;
        b=il8833ZNI7c/g3HqRvrCJVOR/dQMsHKLLphHOG/VV7yLwezmnamPwtN6oWSq/jAM6j
         BchGZhCVqbM6emeY3jtQjSAEyRSW/WWA8YW3hX6pYhsMlxzSV8RWO4yCfUlyVJ1dfU0K
         S6SC52K+MUdgfePFNtNlPpWlWIagE2krq74c0e92AHV5GwkpN1WiGPiaEZ89YIxouKCg
         I1MLCMjl0XjLjwx/J2zPySzJKUM+Xj5+JF8OppSaBXQ9GQ6CxXRZuARnYqadjx6pEjgE
         bigfaFphA85iM9nxwlr6JekvSVRFDKM13zbygEQ4JtLdq+yQrUETNakyemJN5Qmr49N3
         zLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785092498; x=1785697298;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OM2orbDlhm3YFBnFC23eCT4mEbL7eF4VVSgAozJISpc=;
        b=CPaQctVF/nDor7+8L8ZsDeEsw0ryeF4izZR2UKSD/dkvttgew7KpdPe634lPTHRZLx
         Vtp5quoLBwl5QQxl9HQt0+rKDvpimboWCG9QNhhvP5SSI9xazSta6UBoFF1skjCnBUYP
         FmHB0Q0d/ev4wPLBPhdKdT8CPJw5M7MdZU/cb7a+4iUQRwvU5v05G4lW8WZm9i9HuNXE
         2HW+TVGHA2SZUSfdwVAqtf7RlMLyy/ixRrWU/isptBXxwV5gyXGQ3HPhKJFKQFsMjUIP
         pt/sO9k9UYLKFBxH+5x1E4OFqIaQm7oNfiQEdzZRbgJjOXkJsUwKB6BW2gzpOTnPW0rT
         L6TQ==
X-Gm-Message-State: AOJu0YzWVONYQLLlQXM71L576ykKQNCGxLBmajIhIi7GlhlJlmcDctZk
	GSRRgjTzsSgo0eSm6CYXn5rygOUjYO6Ux8+LRetPp8m5+P0RtJcM/ma2ExhieBuTqAeQISZm3rT
	3TAJmGkYoEiXcZIu2EKe+/WyqyKuuRI/VvVDRMo4XRJVdh/4piMxYI7Slroimb91o
X-Gm-Gg: AR+sD12wMZYmsWr6kkJU3HQG6+Kn+7t0Kbm8IXzwRaagsqb5JKDtriVl0LYshQb1wHr
	/gPuH6FMzjRNDFXBCTy59lHQvXpuZTpMU/dQP0by2N/Wo5z17GrUZVh0dnVx93uWu8+Gh8zj7Sv
	gTu6i22858XQdHtMXi5imi7lF3WOlbIdbP7ZaRgA19i60nVxs+Xr1J+Ig3wWT4/GbxARQcq+e6r
	hNAbRus/X7fShVvjgCkxNif4dAZyQ4tzlPgjgtnKz2yDm3ILL/BW+hPtrPhmI+OJbUrLhZFm2lZ
	R5JezduFg/4da4N1o/8a+4OY304E3I0lNr0tV1vl8GjvBkIvVCkLS3ljrH0BWgDoapk0ucfHIdW
	SgHmrsDdFYOeg4qRmasBedBrb5RRO9bookUEAIWmixDrlDE8ZbAyZh054YQ==
X-Received: by 2002:a17:903:2f84:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2cfde6880f2mr55129275ad.5.1785092497618;
        Sun, 26 Jul 2026 12:01:37 -0700 (PDT)
X-Received: by 2002:a17:903:2f84:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2cfde6880f2mr55129035ad.5.1785092497145;
        Sun, 26 Jul 2026 12:01:37 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548f5dsm27133333eec.17.2026.07.26.12.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:01:36 -0700 (PDT)
Message-ID: <16ae1829-1d0e-4006-88bc-5dce2d935415@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 12:01:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20260725141757.1316877-1-julius@bairaktaris.de>
 <20260725141757.1316877-3-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260725141757.1316877-3-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a665992 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ZkeNHXiMe5RA_guOz-8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: EOBhGlxxLiZAjXlEb8cajentRfKAIARq
X-Proofpoint-ORIG-GUID: EOBhGlxxLiZAjXlEb8cajentRfKAIARq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE5MyBTYWx0ZWRfX3uELePn7HERo
 wi2m4Ft94JQTbMUW1vHE7C1GvbF9Ho3aLjk0f9cgI5YK316DNprTYcPVruDy9zuolkXKSyghBo9
 NTeSMO+AwUn68ydoHeRCgIEMwve2/Z8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE5MyBTYWx0ZWRfX8Zzx1utHpQfc
 a0t/vQxwJxHHcXt05Ocw44jjd+KLbbyXQQnx5qzk1LBxXjH3IF2mLYADNc1CnXl07urpiCScw7P
 j4UdoK8nW+1/E87IzcO1Srg+NhFe1NJMvuhwTlEB01tM6+LS5asAb0woCpqDteRPLzG8NO6unG+
 ANq+7SpjnxO99U24/tya6Naf+kzzjjI0gVdo8JfC+LQKznD8HXeHoi0safOUu5ppQsKXnke1+2C
 ORasypswNLtx70bkxKBo1D/uBedVdO3OJ9DQ8gkwfgV4heBiM+Seg8qyJ89CvWwAvlFzPmT6d0r
 nt4z3AtWsF4ckav7Y+lj5JFETWeE5/lFwhvkGAeceQUWOtemH7d+UhctdfJ3DRJQweAZjtU43gi
 TvAlyUT5nLzLYsl1MaUQ5JYs3TImje8WeWnYWkFR+q1oHVzPpnAZ6M5egHU8I3tYf6ZZntxCAW1
 bbRlsHS0wovnORV/g9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_120140_741829_53C9E68E 
X-CRM114-Status: GOOD (  26.15  )
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

On 7/25/2026 7:17 AM, Julius Bairaktaris wrote:
> On IPQ8074 a firmware assert reboots the SoC:
> 
>   Unable to handle kernel read from unreadable memory at virtual address 0
>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
>   Call trace:
>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
>    __napi_poll+0x38/0x188
>    net_rx_action+0x120/0x2c0
> 
> ath11k_core_reconfigure_on_crash() tears the data path down with
> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
> which memsets the ring list. The DP NAPI is still running while that
> happens, so it services a ring whose address pointer has just been
> cleared.
> 
> That function used to disable the interrupts first, until
> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> moved the disable into ath11k_core_reset(). reset_work is only queued
> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
> run it on a real firmware crash. Their recovery goes QMI server exit ->
> restart_work -> ath11k_core_reconfigure_on_crash() ->
> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
> anywhere along it.
> 
> Disable them again on the crash path. The reset path has already done
> so by the time it gets here, hence the ab->is_reset check.
> 
> This is also why the debugfs hw-restart trigger never showed the
> problem: it goes through ath11k_core_reset(), the one path that still
> had the disable.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

nit: Tested-on is not and official upstream tag (it's ath specific) so leave a
blank line between it and the official upstream tags

> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 8039124e7832..8c24fc8828d5 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2334,6 +2334,15 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  
>  	mutex_lock(&ab->core_lock);
>  	ath11k_thermal_unregister(ab);
> +
> +	/* ath11k_core_reset() already disabled the interrupts on the reset

nit: networking code no longer uses a special block comment style, so this
should use the standard kernel block comment style with /* on a line by itself

> +	 * path; only the firmware crash path reaches here with them live.
> +	 */
> +	if (!ab->is_reset) {
> +		ath11k_hif_irq_disable(ab);
> +		ath11k_hif_ce_irq_disable(ab);
> +	}
> +
>  	ath11k_dp_pdev_free(ab);
>  	ath11k_cfr_deinit(ab);
>  	ath11k_spectral_deinit(ab);

Do not post a new series just to fix the nits, but incorporate them if you are
requested to re-spin.

/jeff

