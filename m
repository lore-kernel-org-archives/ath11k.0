Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A7DC3601E
	for <ath11k@archiver.kernel.org>; Thu,  3 Apr 2025 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=; b=yiOucnrHsUpxJ7trZDsLDm4Pmf
	u5I80yLRw8J804JsG9X/1ir4FK9eiTBj216OB1vPZ8jnF7tW/Ez1cTKAvsai+nHMA1o1qFBhX0ta7
	kwJEgalGx+r49vlC4m6rXNVXYoEGYMpcpCTKRGUelLWlGYqR+OSaMBGdfkwFjYH6Y5clXtmdeaxet
	X2f9uFH3MAfOXcsAze7AdeqtvLn9Q6VkU8lr1KtCo0BdH834P4ypXnLy0tBViZ5/wxjGChC2spiLK
	RE41O4fm+0AI3C3n1UR/+FxdTv/GhWTY83b9UsGdcXVq3vdjKvuueq0flxzSLUzETd9WQAG1thi1H
	17LjuSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ElF-000000083wy-1yDt;
	Thu, 03 Apr 2025 07:13:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EjP-000000083f6-39Ws
	for ath11k@lists.infradead.org;
	Thu, 03 Apr 2025 07:11:22 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30bfca745c7so5068511fa.0
        for <ath11k@lists.infradead.org>; Thu, 03 Apr 2025 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743664278; x=1744269078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=F8Nn1t0kI4zdrHM4jYrcKA1qHWs88R99fkqW6VWB9ZwOgktg3D5fn+wHPNnmsCpT7C
         /Mh1Fmkq2hQTZ0IS1+cXbGuPrDVsfVBqdGcA3UxqVnxjPOg3fl/DB8os0NGdKwcdDu5Z
         Nwdj3NalLFHPaD9B31D7lSJO1moAWCeeDq+lec6ccuenqRhedRYn2JfniUvAGNSeiKfJ
         kQtmUIwITnxYi+0dun/IDkQPqmPdJfIUaNolMQlaBKlxOSSCCjyWMTJrSQSpWTZFRsk0
         yM8yjfczof+ui8hWQ4LG5Prf18NG2Eel3vPUpBcBGWBfLLvZklqerSU8whG4JD6+SJZm
         063g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664278; x=1744269078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=MnelOqVry9aoVBDQXHQmD4WSQYs1XrnO+ytWuGnlrx/+xpfX1l573BvViCZd6/6WO6
         nJZ8u0Ex8ErTY5EnFfxpz8ELEAOHHl5GQRJxG+D0x5rQYMoHTg7a6RP6vyh+wCzHPH4C
         twf8LunZ5LBwUi+wPRyoszkuios/5GLo8SJG1A9WDO9HxgKO9HN1aYZCqFdyzpJgt3Iz
         qN5pK5QKhDwO79H6wQAK4cqOwdR1ZaA9yfntOdd/j3lslEBTiv2CfjPjCTg8XoAfCGhU
         OHQ8fAbjvNphnikS+bWhS45HbQnvoj+St6XZOSbRQTNG5BgX774jGVnSUS9eLQoIMqzj
         nFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAUaj8ZHkNOnICj1WPskHf3x883BYoPl0mEwau+k0icodf/uIhRZh3/GTC1F4PmbWPX4x3q3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXgHyqvdIRARB0akpLJ2nvlN0SRqSVejVyaaTrBP2w0jTO7iyv
	vB8SMwqU7zvdcIvp1V0oLrW532uQ0Vdq8ch/FNgvhpiqot961CSQUkHQpj87qemZSixhpeUFuNW
	g9gC9Hm6riYJgF2Y6xKsbFhkmlu5Zc+knlazkeg==
X-Gm-Gg: ASbGncu/hBCen7bIe4j3YpiRiFO9qhgau9adn+hE7grTgPnF4AFKqozI5UnY7qIcneV
	UpqrPjLcg6Al2G8IUFRBH5/HkcEAZdEvOC900aq6E7IARPcl4c6XH+/b/jWDjsq/T7kKGZW7gYI
	ZIwowWaE1uKjuui3l2Cazf14H0oiVqMSmZDkUGS2P/WzF7KSJAckkd1LO5
X-Google-Smtp-Source: AGHT+IFkpl28huUxLnkOG8+JoZRPAuyoYj8fAmCyXd4tv38/gNFXW7fiJiUp5ulgWcmnVTNmKGEylZ2WlPrLdyIQcMA=
X-Received: by 2002:a05:651c:1475:b0:30c:7a7:e87c with SMTP id
 38308e7fff4ca-30ef91e9c23mr19952681fa.35.1743664277849; Thu, 03 Apr 2025
 00:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:11:07 +0200
X-Gm-Features: AQ5f1JoNoWRTnOEMbH9dyhhofmJuk8_vYCLRQWl_3nQ0kPEBcd2NI2XoNIkV_Zo
Message-ID: <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_001119_801074_94BC9E6D 
X-CRM114-Status: UNSURE (   9.67  )
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

On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm re-adding the tag here as otherwise b4 will only pick it up for
patch 4/4 on v2 of the series.

Bartosz

