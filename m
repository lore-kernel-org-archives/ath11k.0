Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C075DC05027
	for <ath11k@archiver.kernel.org>; Mon, 23 Jan 2023 19:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlz5/n4CZEi2QG01OiggfO12NCDd+tDZAECClj7bHQg=; b=gpLzl9w3CGJhnU
	NKui7Zb+6IJbbm6R9b5qNSvRLmOWsIDD88SV4cvgNhSfr0JHqRcdPq8ezkjAHwQeb6DZYO/v1YSJe
	ff74JK5m42rtV5y5FUIbr8bkAa1HC4vxYpjCkUKFYXHanr5sy5aEBmVcObsYCLJN2jOnRo1gPtEE4
	bcG5/L0Of92TKoZyqEIq0KNEt6MvoXVWaEXuLV3f90yZbZUh0xz1JFs978oZKUofCCwhGx6z1nEwg
	RnOAsTyBPUtQLYP5WdNClJFTHu1QYKXmYxDO1p53cY6/tz6wJWExy3dmVyG8kcfXH7JmdISIg7dCk
	j7iyy9coA4El7EPC7vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK2Nf-0018rP-WE; Mon, 23 Jan 2023 19:21:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK2Nd-0018pt-Gh
	for ath11k@lists.infradead.org; Mon, 23 Jan 2023 19:21:23 +0000
Received: by mail-pg1-x532.google.com with SMTP id b6so9751375pgi.7
        for <ath11k@lists.infradead.org>; Mon, 23 Jan 2023 11:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WDXuP5MYYXAbh/GyrwzOk8WyuxyPQCqxZw3q4s3iD6c=;
        b=tkgcEhOicbtfDwCpvIXKnd8G/FRlL5uYYpKH27sdSg0dZinBGyNI6cfbqXcMQ0INuI
         C1vXl3B5WfROQHaBB0ZgIO3DsbL8TTj4olwIR8Ff8qa9Mwt6nTxLZAT5FaJB+xs56xnK
         kVn6WRm+zPNaXAoPyvmPoZJesLk00cfksfuo5LjkfIVGYLZXHeQDXVgDWba83T0JDL9f
         paDtjpJa/3TzNyFo77rj/ulC4nTXdGJQ6eubkNb35Z8FDePEJYd6WRLBU0HwgDwNbOgu
         HaDZQhhPOShpXz4hg0RNu6HNR4i95FnsPr2qF0ogzCM5h0eEPZ1xul/uaFP/kdBaUX5+
         YTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDXuP5MYYXAbh/GyrwzOk8WyuxyPQCqxZw3q4s3iD6c=;
        b=UCCkSs28vpiI3fvkRGwGD7z+KPsnHHnWUZbXNsfpto6GtAPNpWMa1FxgBRCYLd/FOq
         smqQ+y/NqIJ/LwQSo4SnVyB42OEss4lepcjJW4RWaEFgGzF+JVJmKSHyeqjC+BkFli3l
         S8HE7yKlgqhd1uu59xkWMYVDFfOJz9aWgS2Rkj07Awx9PaSmPHjgv/FWa2z0yP89YVFI
         VChM6Weufak8CxaE+7kxzgKXYnb0vyoG0Ft8leFNYhG7YALQMAEgjQJXMUCK3Ekv4Lkh
         Lt6XDA6PFWHINjjRujRLj6x4B/yWCwWqFkZmiuUh77JLGpezobrsuUhDen8pKEikVN3W
         +z6w==
X-Gm-Message-State: AFqh2kpffPOMOgVg3Vjhiu7hHfYIRphj0xNr5Z05BhhCJwrrZ1N9p/5W
	dcF+N6W+M7Hi+qIfXwa9oZwOBFNwBd2GaLHNP2Lrnw==
X-Google-Smtp-Source: AMrXdXuuuKT2bxKJ14LORsl1MPDgTLtc1xr4HHO60shSDgnHFBxnsV//IpkEZxYIMzwOctILURRm6BLFnwBEv1J5vyc=
X-Received: by 2002:a63:a5e:0:b0:4b4:e491:c331 with SMTP id
 z30-20020a630a5e000000b004b4e491c331mr654902pgk.19.1674501679691; Mon, 23 Jan
 2023 11:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org> <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
 <877cxsdrax.fsf@kernel.org> <CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
 <87y1q8ccc4.fsf@kernel.org>
In-Reply-To: <87y1q8ccc4.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 23 Jan 2023 20:21:08 +0100
Message-ID: <CA+HBbNH2fzr_knOE9EWD4bUi-guvRa07FAxc9WyCH0jK10BLvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230123_112121_574391_C5C44141 
X-CRM114-Status: GOOD (  22.98  )
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

On Thu, Jan 12, 2023 at 10:49 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > On Thu, Jan 12, 2023 at 10:40 AM Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Robert Marko <robert.marko@sartura.hr> writes:
> >>
> >> > On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
> >> >>
> >> >> Robert Marko <robert.marko@sartura.hr> writes:
> >> >>
> >> >> >> Really sorry, I just didn't manage to get this finalised due to other
> >> >> >> stuff and now I'm leaving for a two week vacation :(
> >> >> >
> >> >> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> >> >> > and the current workaround for supporting AHB + PCI or multiple PCI
> >> >> > cards is breaking cards like QCA6390 which are obviously really
> >> >> > popular.
> >> >>
> >> >> Sorry, came back only on Monday and trying to catch up slowly. But I
> >> >> submitted the RFC now:
> >> >>
> >> >> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
> >> >
> >> > Great, thanks for that.
> >> >
> >> > Does it depend on firmware-2 being available?
> >>
> >> The final solution for the users will require firmware-2.bin. But for a
> >> quick test you can omit the feature bit test by replacing
> >> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
> >> "true". Just make sure that the firmware release you are using supports
> >> this feature, I believe only recent QCN9074 releases do that.
> >
> > I was able to test on IPQ8074+QCN9074 yesterday by just bypassing the
> > test and it worked.
> >
> > Sideffect is that until firmware-2.bin is available cards like QCA6390
> > wont work like with my hack.
>
> Not following here, can you elaborate what won't work with QCA6390?


Our downstream hack does not work with QCA6390, so that is why its quite
important for OpenWrt to have a generic solution that works on all cards.

Regards,
Robert
>
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
