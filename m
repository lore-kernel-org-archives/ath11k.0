Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A659D3C533
	for <ath11k@archiver.kernel.org>; Thu, 17 Oct 2024 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om7JKcGAWZ68u827J2NuJiVucAUsfrDVJWjUlubbu3U=; b=J7egaAVD4jtYZMN/SWOUnackT/
	MEUcn9M2sATfmVPP5W9A0a9+43s8LKUfRH0cFnGeBsGow2E5BaFi7dRgvhAoPBD7JeUD0awfXhCDF
	eWyD1tORw+arcGcY5WTyjWR/H1zspIYnzNr37TZv9ETPZ32JUZhEECs9wicJ44z9vtm7T/htKmSpr
	MiVW2cD5u7Kn2MR8UuDOPO9RV2vjKpO/H1fBroV4w7i36gwB/PMm/I0N6ZbqRLpOQM/lNjicyQcAb
	/EL5BAhRmwcz6D51trGVI5xRqRdCKelzY8+ux5XFN5nvKde3N+OC6Z4Ypipj7r9aNEpc0yM9JbkQO
	ImXxxmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Yzs-0000000GLCz-3VTd;
	Thu, 17 Oct 2024 22:29:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Yzn-0000000GLCS-3ylv
	for ath11k@lists.infradead.org;
	Thu, 17 Oct 2024 22:29:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1464106e87.3
        for <ath11k@lists.infradead.org>; Thu, 17 Oct 2024 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729204166; x=1729808966; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Om7JKcGAWZ68u827J2NuJiVucAUsfrDVJWjUlubbu3U=;
        b=WAmz1iXwP6draWuCsAbQTqLTFKwr9Rn2Q133FFP1lwLj2o0S9zmKs8+doylXjxku7M
         BYqPy7PcplHM5fue72ZWXfLpE7rilTrJiB4zy3pdh3FL6C8nWZ8srJLoBPZ0V509ZA4E
         2F8DDths+OMUUv9M38jqyWUcWsSCW5gwaFHn/QXcpfThdnRqH20Xkq4hBXU4ov1t2Ka3
         bZHXw9G4lwa1bjlY+n6+JntX3lfTnjvlkZuYo4lfJ4UzX+eUf1ue4/IjQ6o9V2T8rCgO
         hfUOvTMU50i+z94Uis8SXzW8NbruN+Tatf40zdi8uhAIkAqrR3w34rmvmn6SQZAfnXPS
         InQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729204166; x=1729808966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om7JKcGAWZ68u827J2NuJiVucAUsfrDVJWjUlubbu3U=;
        b=vx6R2IpXrrKeNhbC7ZZzlLQxKb44VVdl52wb7vbAWyppQFRD/y+mfHYEcFDmOsVHJL
         +v3p2tPyLPPE37H3wFTOInUAb33OGgSx0GAseZACBaOUYrsTLZPYC3UHVVbSDX1Baztz
         Nmp043ckoC0gO6DsxypBcy2X6MO9vpPDVysPYsJIwngRUoKsfFpyO8HgN/zeyi0mcbvY
         MYalPa/jgkqmxwPZyANZIQiXc/gkl2vzFPTPwCJnhkdwKmR6AK4q4lvcErjzJzV0VrOf
         8U8TnvBvZO9AQ+GdPoHmRGdwzL0zr6uplguROBfPbvVjbB6vnE97oSyndByqvzcED63p
         Bhaw==
X-Forwarded-Encrypted: i=1; AJvYcCU3im8UWXg/uJA8+MmAeqESS0TkHhnxvdKYxAsOu6nsg7XZFRAKgmgPe7nSy8Y4b5CHOWC92VU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNOZgmjqRsY+FHpRiklie3Gqf7Je/dAzGpwJ8KShWOatZBFZlp
	Om7U0eSEwCQXaI97MzKPNZi8S668zl4FwdDhVPDB6mFHtY6QpA0Jtnku+ISDq9WtSpjJBRDze2j
	9nWQ=
X-Google-Smtp-Source: AGHT+IFsxCgdKdVcgcoZD4gFCmbJZFyg3QiNCRkJLlIo3r8WemXMba9iczdeWP260u66TYNvUvXXow==
X-Received: by 2002:a05:6512:3d20:b0:539:e761:c21a with SMTP id 2adb3069b0e04-53a1544629amr276391e87.48.1729204165954;
        Thu, 17 Oct 2024 15:29:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b9343sm46886e87.85.2024.10.17.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:29:24 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:29:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Message-ID: <mvzwlbeopenn5hpll3rmkdwcc7r7ir263nwvlh2hiy73qeipl6@nh4angyrt5p2>
References: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_152928_013504_3CFFFAA7 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, Oct 16, 2024 at 07:24:09PM +0530, Balaji Pothunoori wrote:
> auto_boot flag ensures to take the firmware and boots it
> up during the wpss remoteproc start.
> wpss host driver would like to control the load and unload
> of the firmware during the load and unload of the driver.
> Hence, disable the "auto boot" for wpss.

Which driver? What is the reason for manual control?
The board seems to function properly with the ath11k driver, which
doesn't seem to require manual control.

> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
> Cc: ath11k@lists.infradead.org
> Cc: Kalle Valo <kvalo@kernel.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..05963d7924df 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1344,7 +1344,7 @@ static const struct adsp_data sc7280_wpss_resource = {
>  	.crash_reason_smem = 626,
>  	.firmware_name = "wpss.mdt",
>  	.pas_id = 6,
> -	.auto_boot = true,
> +	.auto_boot = false,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
>  		"mx",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

