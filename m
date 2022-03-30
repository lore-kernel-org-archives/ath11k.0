Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32FEC433EF
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jILZKkbWJ9+QqfmzFbv66NIqPyHFsDJoZLx7Guq444Y=; b=AioLF0LRzQ5V0nHmtSt7pqrlBX
	dwzy5y0VpGDGEH77DI4Q1gx99VSqeVYd6S672c4vwPaWa8e9+3qLv3Kl0Qy2i0twF9TLjUteljVRt
	eYAeA/EtB/vLQMrslSrUnnzU23tV0e0cUWCzf3vdYnpkhncMEwB4cOu+ifrzGip41vtxYHAJOMTFn
	5P6Dfh93MT38GkQ2emn+8wv9tiwMFrKHCgBlir0p4JMfVZ0eIQaOsP9l4usbN8WrBmD5VpXiwSx2L
	H6N4BE8eYoO7bNXy0kHFKWWC61ZSqDdMujJ/ozXiBMKKtsV9+OCLb2n2t5zKw6q7wg49XpiveM1O/
	tC9pNGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXuy-00Fvuz-7B; Wed, 30 Mar 2022 12:59:20 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZXtn-00FvLS-01
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 12:58:08 +0000
Received: by mail-qk1-x734.google.com with SMTP id 1so16512403qke.1
 for <ath11k@lists.infradead.org>; Wed, 30 Mar 2022 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=rY9qBjqOW4WRfUl/0eo4m031YUEP8uFaHtTN2qAei88=;
 b=jldou1Ueyg1w0QAJyT4XZRqkH4TB8YZ08m0CM57wUavg8Wx5JUf43wVxOszbHdf8q+
 WWRf7X91SA2Ry4b3hvdljKGRAhij2lkSViI4CIRcLlRuIlevQ+TlvStJoljT1ybowvhG
 zWTx3G0kx0d6/KEGri8Ne0WqpW4bSLa5WmUiwaj5bFRidm0v42EoSt0mS8tFuoQluotK
 MP2oCa01zvamoJ5p8Zp7jxPdYtL44nyO89SKxNMn2zSN2f+tqVg6Aor3AvUtBGCwYEvY
 y+poGdyqo4ZP4qxT9bQxaeQiYd9cNUImzJA9zvqJ2DzQ8beu5/qp0a2vHkn/bM1pLOzJ
 tWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=rY9qBjqOW4WRfUl/0eo4m031YUEP8uFaHtTN2qAei88=;
 b=vesp18OiDcLPiTkGuQxtsiDnR3FKoCh4CsypV9CeOP06J0akSfhUZVof3dLkc65vDS
 tOdNV1N4NsQ0ljBeyXhw2qBQKQs79u0GjdMPG4UjJfEhU3ZmtwAICyWodCRkRyKQTwpM
 ukEMPThBFnzzqMZMqBNWFPK8FZPI4txo8BZzoKyErC0gVAU1mstXGaU9eR2MhuyeZEQP
 7YZb1B1LGLpK/cL/O1Dsx1SoZTUmPT2JIC1YMqgNVZNSlt9fG2fzMfxztGS7jwJd4URH
 d6VSC6M7N0Ju0NaJT2+ahdhKCKN3ufCMFN78GFLUmCPi1uWfKrXTwmDFe6aPK9em0I8/
 ByJg==
X-Gm-Message-State: AOAM533fYC9e2rJTnMaP3a7G/nXO8+h/1Zsez9faeMh2qGMeloUEGXmJ
 S6FxcTryIKz8Vr5iqonmGQiiXMvqW7aPLTt/u78F6ePVfRQ=
X-Google-Smtp-Source: ABdhPJzz6vaVkM/UA6tZ3WkiZBu/UsN0ovNxiTrm73RY6ovfxQB+89Irq9auF4hU8be1DOrjucf2NhKasMfbdVhjkso=
X-Received: by 2002:a05:620a:4311:b0:67e:8a0f:4cd5 with SMTP id
 u17-20020a05620a431100b0067e8a0f4cd5mr24020181qko.363.1648645084453; Wed, 30
 Mar 2022 05:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <00ece2e5-7bcb-0b2b-23d2-e25cf4c9d13e@linaro.org>
In-Reply-To: <00ece2e5-7bcb-0b2b-23d2-e25cf4c9d13e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Mar 2022 15:57:53 +0300
Message-ID: <CAA8EJppG0FXj_n-CdGbX6b+sGrTb0_FG_tCZ0GeSEsCcz0mR3A@mail.gmail.com>
Subject: Re: ath11k-firmware: QCA6390 hw2.0: add RB5-specific BDF
To: ath11k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_055807_108873_5F50E777 
X-CRM114-Status: GOOD (  14.35  )
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

Hi,

On Fri, 18 Feb 2022 at 08:15, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> We'd like to ask for inclusion for the board file for Qualcomm Robotics
> RB5 Development Kit.
>
> Following the questions from the ath10k wiki page:

A gracious question. I have followed the procedure described in the
ath10k wiki, receiving no response in the past month. Is something
wrong with the request?

We'd also like to submit several other board files:
 - for the RB3 board (WCN3990, hw 1.0)
 - for the Dragonboard 820c (QCA6174, hw 3.0)

Do they stand a chance to be accepted?

>
> * description for what hardware this is
>   - It an QRB5165 (a variant of SM8250) based board.
>   - It uses qca6391 chip as a WiFi and BT radio
>
> * origin of the board file
>   - It comes from the BSP package distributed by Linaro
> (http://releases.linaro.org/96boards/rb5/qualcomm/firmware/RB5_firmware_20210901-v6.zip)
>
> * ids to be used with the board file
>   - bus=pci,qmi-chip-id=0,qmi-board-id=4
>
> * md5sum of each new board file to add
>
> $ md5sum *
> ac812072da8de6bd4de257cf5bb870c7  bus=pci,qmi-chip-id=0,qmi-board-id=4.bin
> $ sha256sum *
> 8cc579b1f8b874e64a8518d7eb6a702aa7bab65744261f0feb1671e5436c5e55
> bus=pci,qmi-chip-id=0,qmi-board-id=4.bin
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
