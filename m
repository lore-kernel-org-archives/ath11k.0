Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC22CE7AA5
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 00:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmfjfcKndugulugA7EAwTHkPQhPDlb23XTWYgaDDGF0=; b=juDaZL26z1fzRgSkXm5HSdk4iD
	aEu0iZLTqs1BJsFebt4sXfpNDq3RZEON2B5XgEAjEbzxFBKGZfs+xElM4Bn4ZBHfup656lTcZsB/7
	RN0RD1P6lHa8Et0ZpXHaTN5pgcJpehxU+NIQA6p9durDJ44XqCkfCVwCi6KivzUjQcTFRpJ4iQ/MH
	BPI1ESJQiTPSBzcHbh5U3gIflocIFQq/OJuMhx331k2AlMFBXPnBUt/Jbj7GX5ZAQGt+Vwjr3MdH4
	IS06H2IRuQNagjq03+SiNopYJgwaA0VpxbHboVTpFCZN9m7CwCOiYxt1u6lwHIxpNpoiRahDHufI7
	OUiVZl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smNA1-0000000AE7X-3TZl;
	Fri, 06 Sep 2024 00:49:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smN9z-0000000AE75-2Txe
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 00:49:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52f01b8738dso1015727e87.1
        for <ath11k@lists.infradead.org>; Thu, 05 Sep 2024 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725583750; x=1726188550; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmfjfcKndugulugA7EAwTHkPQhPDlb23XTWYgaDDGF0=;
        b=Z9QfNexULHXpfYWFGr/FYWxeWD7Lyi87Hnj+pTvrIJO34fLTsj0ROnL5v6ZgpehwGA
         eIjFI1jdY0BfsrS4jIrlHGXZFKY3by3msblg8NpGWHYjfKRNT2D5youxXwQeryXJOLNM
         kE0qUted05XAzBV1449QddtTCEynY3dKr8EpcqUzc1yPTWBqx7wkuXjKRBai4SJcryoU
         oV2s6nMys9hHjhzAUQwHBbwdqPdId2AHbgybFkjUNaGJ3DTW+47tNWXr9SdCsM3pe31F
         rlr4F1MiDqg35qRjBY3Q+P5qHsyb6T85ryZ3yfyfRDH3lu/sigPZYt5zhypfyX+3m/mC
         HSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725583750; x=1726188550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmfjfcKndugulugA7EAwTHkPQhPDlb23XTWYgaDDGF0=;
        b=SSfcGLf49VUN2YgIcWyGkWMn5Ta5r5qzOzo92BVKfmLGmkB+IEBb83EVCTUWFa8Zj4
         SfXDkrhyG0qQ3YzOVNuCqixNDfOh51GthaoZQMaMNfN0A4lmAM787PHFkCdKmqLoEoHV
         zDSCGd3X0iBHaFOUIXpnh2H1Qs3PyYDGcKLQ+ias5Uh6JctWRFVwzNPVyXekgkHzdImn
         y4lLhzD4sACIJUjruWS8naDTPWJyex9GddtmBeEZrzwqKEfJCgi/6Wsc3g5LJXdOyH8r
         9tcdEte461LsGvuVoEiRZ6B5nB95tY1JmOeqHvt8CevYWGL7KzIYOmbnCsCTSkaAgnyH
         J6nw==
X-Forwarded-Encrypted: i=1; AJvYcCU86JHn3TFl53Hd2PpylJ6Lf3p1leVgAhVyGD8ieoGh2rucDWkYFIB4gDiYIqz8EJCA34uKlGE=@lists.infradead.org
X-Gm-Message-State: AOJu0YygMXoUDIMY/0J0jlfu9TYGED3AqfVKLe2vYRU4Nj5ChuBtEb5D
	oug5KY91OHioDnTJLXIf5+H/Qdr0aEQSxHycxtX/NxEgf5TDSQxgcm7J1+TMmS0EZEf7IXrpD94
	w
X-Google-Smtp-Source: AGHT+IHIffC63U9mjEj2zVgbFJlFMy6oAWzMOiRekHkT67HeuZh2MpHA/BdRyQn6y5VmaPvlk2BXQg==
X-Received: by 2002:a05:6512:3ba1:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-536587a40c6mr385814e87.8.1725583748976;
        Thu, 05 Sep 2024 17:49:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53568959814sm544349e87.251.2024.09.05.17.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 17:49:08 -0700 (PDT)
Date: Fri, 6 Sep 2024 03:49:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, ath11k@lists.infradead.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, agross@kernel.org, andersson@kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org, 
	quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
 <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_174911_663686_598380C5 
X-CRM114-Status: GOOD (  16.42  )
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

On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
> 
> 
> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> > > 
> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
> > >   2 files changed, 120 insertions(+), 1 deletion(-)
> > > 
> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
> > >   &xo_board_clk {
> > >   	clock-frequency = <38400000>;
> > >   };
> > > +
> > > +&pcieport0 {
> > > +	wifi@0 {
> > > +		compatible = "pci17cb,1101";
> > > +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > +
> > > +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > > +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > > +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > > +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > > +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > > +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > > +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> > > +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > > +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > 
> > Please add
> > 
> > qcom,ath11k-calibration-variant = "name";
> 
> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.

NAK, nodes describe hardware, not drivers. And we have had enough issues
with the WCN wifi having collisions on the board-id / chip-id / etc.

Maybe we should make calibration-data required for the DT-based systems?
Kalle, WDYT?

-- 
With best wishes
Dmitry

