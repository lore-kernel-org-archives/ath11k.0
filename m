Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A834CF11FC
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=; b=mW6obq1fBTsyLnYeb747p2SgqP
	g9BgUQrMyX816bPJLaVGER3ocy6qLiAHSrnnMehrqwAwAKwKropmiSdIxja/ByDttWchG7o4PdKj4
	/hnltYARlx+SKxO2NpA9q1cEuFW2W/yUY9McRniEWmSg6SDnLkYAQ28lLBV8fuV9iHkR/R86oqy15
	Ka9RaPO+q79YWL0uRf5gJbvwsSwU6qn+7iadjarHCRbkN9LPb9R6Ii3HPswE0tr7YfP5dHEjQhpJg
	7pQGHLSLRLX8CZWMXlw9Os1nvOiLrUefAl1dN9rxXh6ZimqZY9m0zzM97YC51EmwE7Ss4FwQTiHOX
	lx9OhCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syuuo-0000000DHvN-1Dgz;
	Thu, 10 Oct 2024 15:17:22 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syuLW-0000000D9M4-2BgX
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 14:40:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso1354324e87.1
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728571252; x=1729176052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=;
        b=GOkxG75lQ6XmfVb/eYY8vYPvoxy/rbVSowa5nbWyUTaOE8PjRJKBZh1OSPbI7KV2nX
         RO2K5iSfHlyC5WW9nbT6+tGRbvmwFQ0ZU7uC+JIVCrOq76AzmubRGPKE0qT3bXa7SldX
         UUBnqhYB0/aMlsE/9L6lrYIMJh2USIfb2PNgTHL4CWO36Oi4ZDmw2LZ265elpr2kKoI2
         7hgd47dOlseUkTLKZSs57rUcTYUhkP4AHMkZkwLD+kBVuZhzWZwpGxhDSs7Xn/Ujmt7Y
         xe3sBRMFE5+rqUC4uA1/icB6eQZi0wyeeGe9C8zARF9EnKc9LE6xIOBjuNi4qLG7Nljr
         RW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571252; x=1729176052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=;
        b=ri43njccmmi+lMg1199KEWjXne3t3D4pLpOUKW9drJPMUP29e3Xi2jQR6a7wNnndgo
         lQWj6rW9dzq/jXX9jfq6BR16Xge6D/hmC9qmeR8NzdImDa3hQTj60qOa7OQcDRmOebiX
         GPNVa1JEDS4Yr8J5DZ2aWuwn7//0lV7AVdNwKda3W3PYZ7cxudRWL7U+k06FQ5b7snfy
         gRxFudi4tityavL0gPYlL4NZ5YRRVl4zyrUOPgaK238J5w7Ik72EtNhzNVOl4/OEmOqY
         m1SjXbdaCEOIe9mHbMkoKXFR+usninisF8+Kfp53JbnRTTjLPcVrjp84uvah7anfJyti
         diEg==
X-Forwarded-Encrypted: i=1; AJvYcCUgTzK9uqXswTS5M5Wn2y6GHZb3V1i3YpdcPWsuGZKhLBNaj68Vl+WeXzQzuySJlWapF0gJPQQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxO4gFLkheh+An6OIpDuAJkAc8ByNGpLw8z5FV68XAPFOfGc6Tj
	/stPO2vqQ0WxUM3LURZDFnzwQQf2iYaPg4ZKUbkqSdYVWIqAUK4Kx1CLEmJiqd8=
X-Google-Smtp-Source: AGHT+IFUFKq0lYxlNzsXXq0fVnKrrxCKW8Nx3h/E3Xc0xNLj22cjL5q4txAh0aZwNXPW20/Wr1C2qg==
X-Received: by 2002:a05:6512:2348:b0:52e:9b9e:a6cb with SMTP id 2adb3069b0e04-539c4899755mr4276741e87.15.1728571252194;
        Thu, 10 Oct 2024 07:40:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8a54sm273302e87.115.2024.10.10.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:40:49 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
 <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
 <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_074054_620170_F13025A7 
X-CRM114-Status: GOOD (  19.56  )
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

On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
> 
> 
> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> > > 
> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> > > ---
> > > v2:
> > >    - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
> > >    - relocate pcieport0 node in alphabetical order.
> > > v3:
> > >    - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> > > v4:
> > >    - update 'ath11k-calibration-variant' to "Ride".
> > 
> > What exactly is Ride? Is there just one Ride board? I thought it's a
> > board family name.
> 
> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
> 'Ride r3' boards are attached with WCN6855 WLAN chip.
> 
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
> qcom,ath11k-calibration-variant = "Fairphone_5";
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
> qcom,ath11k-calibration-variant = "SHIFTphone_8";
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
> qcom,ath11k-calibration-variant = "LE_X13S";

There definitely are other Ride boards. I see patches related to
qcs8300-ride. Does that board use the same BDF file?  If not,
Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.

> > 
> > Also, could you please extend the commit message with messages from the
> > ath11k driver, showing the chip_id / board_id ?
> 
> The board-id is non 0xff, do you still think we need to add
> 'qcom,ath11k-calibration-variant', following is the WLAN chip board data
> info,
> 
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin

I'd ask Kalle / Jeff to answer this question. Are we sure that this
board-id won't be reused by any else device?

-- 
With best wishes
Dmitry

