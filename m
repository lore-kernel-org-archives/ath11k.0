Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B03BD2FFEC
	for <ath11k@archiver.kernel.org>; Fri, 18 Oct 2024 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIt2ZgCz6/2u04try8W/s+t9Roe8RkNgbgiZjheFS+w=; b=rW8XP9HbeUvYhAP6tymRiypnlm
	qpmifZ76LRSkbnVmFPGWX+auByBBkPhZnial6dkzoWsncG2IEmj4G/DOEWP0MKg4XtFMliileoVGi
	GJ8GPXxM/4U/VNKGXwViX4ZbZ1g3oE/u0CnZHsDko8d1u/trLrQxUzX4S4SfYpU2mXn9NIOG5vn/P
	CTC8CUmPwGMDK6gT9tRun8DI0seKnSwSt5yWY4pZ1JJ9O3KGmXioonjLacl+Z9oUAsTKKFCy1ZSsi
	3McSj75DEWRG/ZO56AZp+y5dg8SSrRFHF7wmqZLs/+JHIWc4sfe72xu7grj4kMqmH+YRqkcmgOAiu
	5XvO7YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ksc-00000000VNg-3o17;
	Fri, 18 Oct 2024 11:10:50 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1krJ-00000000V6A-2WRW
	for ath11k@lists.infradead.org;
	Fri, 18 Oct 2024 11:09:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2374903e87.2
        for <ath11k@lists.infradead.org>; Fri, 18 Oct 2024 04:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729249767; x=1729854567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIt2ZgCz6/2u04try8W/s+t9Roe8RkNgbgiZjheFS+w=;
        b=ZSleWtiwPacxzqykJ1jOqTF4R6gpNUBLjkR3poJOSHar2nCTu3LVPsRjO1uZ2Kbl0p
         PYaie+1jqC0ZFqEKIkZN5IjL76OPgNWkJMXbIAUgmbzMXcHTbg74kcnTuORDCHU1KBdE
         YseFxbSNnu90fWeNvwCsDjVW7BEm7s6Qz6+Xni9bDgkTPvdgh1o9aKcRzTNd6B8VfaVF
         7S6z7AjT6iR0kBkGiVoOdcykWJjlvG3QfvbAWyME5vL0flTORluaLKYcxqEncGibpc8E
         VEyQNvdILURBAMBEQ+1Bs/gke3XHMk5FrbpvYVwA2IhsrZYtujZQIhpTvo/5EkVsgxle
         jTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729249767; x=1729854567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIt2ZgCz6/2u04try8W/s+t9Roe8RkNgbgiZjheFS+w=;
        b=D77p8wLguftYiT2hWnjjoE6qvitSo4yhQ82tC80E2U7T6TqRShoyu3hn9pSbrjZD7H
         9sQvG6pt89xilGblY+HgsIsEqT14K74XnUpxsnUUHhRPN2MD0ERsLm8F1+kG3ML3F5Ou
         owwjNZpRcqAQ1Dhy3tI3nvYmeMWQJ3rCGQW+fC9g/0jPjqlwsGoZpvz+ueFledJeXz3s
         VPA1TX7IvH8eMFjBTEUEWoMIQcAMw8tihUxiGtMPOHQmbNgwMZqHSzFuc8qw36LdiVCv
         H4SmUFrUAutitimqhjbQdk3KEK4/sKc65sbfoou3j693Qcg9OVjsEW6OLUmvzkHD9Kzh
         wgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXTR+c5nKkY7/x3Kk0G+szJverhVwebrRaTAa5FcevadxSaRIubvL4D9uNGu2MwEngOdBfxluI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Rc+A99h8ZS0u9/GoHOvgQQGFNRBqgTpEvlK4+oyybqROIy8q
	lc+nlgtECjYpL8J0WYQ+45eM3uWBGSLYteUGEuXmaoWywkl8MDqO+Z+oMCw6lIs=
X-Google-Smtp-Source: AGHT+IGQcoRjkME8sB/QzR808hEBcFeX1bRQ7Ps+vQJxPs0k7IOBUWWNJ5veYpKKDLhJoGJiAwODNg==
X-Received: by 2002:ac2:4c48:0:b0:539:f699:4954 with SMTP id 2adb3069b0e04-53a1546ca04mr1270371e87.58.1729249767449;
        Fri, 18 Oct 2024 04:09:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15214e7esm190571e87.259.2024.10.18.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:09:26 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:09:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org, kvalo@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Message-ID: <ho24wc35ssaecs4hqqbyuqizfamr6fffrzp62v6eevprzbjmx5@qx7urvuaptqq>
References: <20241018105911.165415-1-quic_bpothuno@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018105911.165415-1-quic_bpothuno@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_040929_697577_C7856FC8 
X-CRM114-Status: GOOD (  10.32  )
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

On Fri, Oct 18, 2024 at 04:29:11PM +0530, Balaji Pothunoori wrote:
> Currently, the rproc "atomic_t power" variable is incremented during:
> a. WPSS rproc auto boot.
> b. AHB power on for ath11k.
> 
> During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails
> to unload the WPSS firmware because the rproc->power value is '2',
> causing the atomic_dec_and_test(&rproc->power) condition to fail.
> 
> Consequently, during AHB power on (insmod ath11k_ahb.ko),
> QMI_WLANFW_HOST_CAP_REQ_V01 fails due to the host and firmware QMI
> states being out of sync.
> 
> Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
> v2: updated commit text.
>     added Fixes/cc:stable tags.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

