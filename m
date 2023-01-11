Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B99C46467
	for <ath11k@archiver.kernel.org>; Wed, 11 Jan 2023 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pxvmQbzMxknYrdIe1gCq+rfB3FTFWzQnYJHTXoPXaY=; b=a9ObMgJwA1/cZM
	T1VnVVgR09YSop3Pcbm1Ul3G98jW4v73aU6tmaVIE4foQewM489h6l2L9Wjxp4S0DKHLRwJSkleC/
	eHwLM1lP5GY0Q/NQAClOvj3ctUscKo7nLlkErSG5JHbQjrfU7n9j9bIZPT575w0Vb5XX1tNKkb68t
	pBIINy2jlyc7Gz/ODjPUlqLGuo5psbtpuma78Lg1bTjl6Ob7MdDnnMN9vrpZ2dMs+q+fkVGevREfz
	1eGcFPfyfXREr9NgcI4J0BlGqjJS5jzxpSmL6NRveCbZlG111jSGVyUNUQNmtY+oZDFmucdzgmdek
	0KgV2ac9VAmzJnsW+RVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFecp-00CKST-HO; Wed, 11 Jan 2023 17:10:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFeck-00CKQU-NM
	for ath11k@lists.infradead.org; Wed, 11 Jan 2023 17:10:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id jl4so17436699plb.8
        for <ath11k@lists.infradead.org>; Wed, 11 Jan 2023 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wbn0wOToWYz8Hqus0qOCdl65fCabjHuCUD8bFfQCj64=;
        b=PfTiVUep3xEEXd1CwcCgWM/skOcA1SOl2c2pnoewwiTXqAFMRGYHEl3tAboy/P89Sx
         hesN2lBOF8VTEH1Qp04k02SidAjeJqkEOnIdXRBOxY48WBLosMNAJFvvum8BhHb7e1CR
         zVf+o46D6GdR5hmPJEV50J31C38Ei+Sfa3W6CkKm19IakoKwdFz00D4Xz59YhYvmM8DR
         0hnmQK79ppN6iRtRvzIHPNacgW//0PM9q0amW3hax1NyiAEG3XZ4J/8oVlG6Dli1Extt
         zAj40+jCRt9lbx4zbAELmflze88AdQgaPX3RLOW67JGhc24wPdAYagNZ815W6G1ltHnN
         UpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbn0wOToWYz8Hqus0qOCdl65fCabjHuCUD8bFfQCj64=;
        b=TddE0GlNXipoD2JxFFgX1/xffOqyDNZLKXnfdHcn7bGmPcKkpuP45E072HqgfZwBGw
         XyQekJinz2dUUIP0E5FCjH/BOeYlwsFk6L0FfR63UFc1H7S6d9p0DjpeAYGrOgKhM81F
         jAtmhubjRcRab/sNfA8tWga+gzcc2AYHee42gqlosZDu8bPLCH71SgvHNl2GawjZ316s
         7crlRFJaqR75O6lEKkDgxgIxbpaEy37QPcfxCf9LTGMBMWJ09fzoCC6+OIf5L8aaaU1V
         1nTFifKj/Yhvez0hSwuJn72xoEEB0C1H9tGZjYPjY3GT1Qy6l4AExCl5RDvB2EHvZBHA
         E4SA==
X-Gm-Message-State: AFqh2krXt+uLZBtUkz8l5r6TfIgpnvCOcjONsciCsRmgPNUXUFexBuOo
	Dh6FA5Y8b+PUIzKJ56WKt6lhw5aWGwrio6rwi+ISQw==
X-Google-Smtp-Source: AMrXdXuyLrj3KOt2zYA3aATYluNcRvTg5OCBMB3qKOVlm/93ZiJeMguzrue9ZVjvaNF+I7+L+/kGDr2M31vnIlaQdGE=
X-Received: by 2002:a17:902:8643:b0:192:ca49:4c50 with SMTP id
 y3-20020a170902864300b00192ca494c50mr2809774plt.36.1673457049979; Wed, 11 Jan
 2023 09:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org>
In-Reply-To: <87358hyp3x.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Jan 2023 18:10:38 +0100
Message-ID: <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To: Kalle Valo <kvalo@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Robert Marko <robimarko@gmail.com>, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	gregkh@linuxfoundation.org, elder@linaro.org, hemantk@codeaurora.org, 
	quic_jhugo@quicinc.com, quic_qianyu@quicinc.com, bbhatt@codeaurora.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, ansuelsmth@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_091050_817827_B717C967 
X-CRM114-Status: GOOD (  13.71  )
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

On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> >> Really sorry, I just didn't manage to get this finalised due to other
> >> stuff and now I'm leaving for a two week vacation :(
> >
> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> > and the current workaround for supporting AHB + PCI or multiple PCI
> > cards is breaking cards like QCA6390 which are obviously really
> > popular.
>
> Sorry, came back only on Monday and trying to catch up slowly. But I
> submitted the RFC now:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/

Great, thanks for that.

Does it depend on firmware-2 being available?

Regards,
Robert
>
> Please take a look and let me know what you think.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
