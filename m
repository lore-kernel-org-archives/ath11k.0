Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1063BC77B60
	for <ath11k@archiver.kernel.org>; Wed, 26 Apr 2023 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdW40A1XggVX7Ynj7GP66TXzQLoaA9BVh3QK08WKH+c=; b=il+ltKw69LQsmW
	0YCkfz3geWKjbZxlBEe9NKisEPY77cULRNmNrWnD8JnHMPl7CHrvhBKXBmVVB/DUE8sKsP9jjRgaA
	zIF0eCQjdGXbYKjimcDwdrRtSDqTF5hjRcWi15o+Wm5uQyuj3o7WBGbvpARs8D+PMrPQEny9uzidz
	bhv2r2t9VVDPdbcNVXlWpiHQ4CvigU3JVIhu5d8aKsBVWNxhMOlM6WDM5UI4/QXm9z+lMHrb7cKii
	O2PmME2hdAkJ9I1VSse0yXbSE0LlkTTkWjOZGS8DIKUmHzXWeRFfb9csinCJ5GDykI9weQJhT5EUM
	Cv/1iW7NRscjGqZhN0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prfSf-0047GG-1f;
	Wed, 26 Apr 2023 13:45:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preRy-003wrR-1R
	for ath11k@lists.infradead.org;
	Wed, 26 Apr 2023 12:40:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b50a02bffso5810688b3a.2
        for <ath11k@lists.infradead.org>; Wed, 26 Apr 2023 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682512843; x=1685104843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sosN6q7mjWABQa1iFcHLQ7HcWfsjeMtm3Mt392Dc1Ok=;
        b=LHEhXfBwsoX5wQPtnAnd/oSeQOBl5rvEvn7Jq2inf11DTsMzwiilhui/ckik+6rGNf
         qeVSAL7SRVHE2nj23tcVdeylQ9ODv7KttwZEha1dl04Uz2VuK3FanEMlfBA1WRgs8POM
         G5Ae8uveZTMTYzFkzAjfO1rOf0DgWsHV2pin2KVCMJlqlF0CcP/ObpMkkG2KwrmYvR+a
         DjmeyUb0tbVgM1POPQ0QoY/JJ/MDIiTWVHa4UgyNxL2IJW8DVXfSmB5msXnAe6NgA4Vu
         9O2zG9VNIeDLh8bo3BQSxEQsCc1d9giheLcKV3mnd6NGuLTmQZvN7zs67YTC7hIIblOE
         w+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682512843; x=1685104843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sosN6q7mjWABQa1iFcHLQ7HcWfsjeMtm3Mt392Dc1Ok=;
        b=SYRWnBbvAMHYcua9e3/k5+s79QMaEHIbnzmG4M3Gk0llmbmoz3V1Lm2Jy7a7zX4HPn
         VE3oj5HKlejC/CFOf4FRO9AzFfYYaoTKT28dM9iAXBS9/Hdw0khE77mIJYU9ckmbthOg
         S5wdiTyESJQMwHVVUGam/Iru9wS6YTiViqnHpJWLy8VhRKJRJcSFUA0LwD3z7eV7hfUH
         s/5haVm++IST+YteDlcpi3V8C5FMce7BomsW74aIJsFm1gJEkZyTQS9V3sB9Lb8P5Mhr
         FQhNAwsO+PZq2Dm5mXT81gHG555yzyloyW3QO7HF5h16motT7gfmybqrPJB1bMLfVwY+
         YR5g==
X-Gm-Message-State: AAQBX9f7NrUp/qDvcdSwg3CGfW6SJ83BmCb2T8B+9iKe1VBNWK675FvC
	70pEceAFGU1IdwlF16zt1jul9Gdsg/UQfCjSikc=
X-Google-Smtp-Source: AKy350ayHesJaV9Si6f/E/Wp+h9A2uT5MsJ/lHDtqljcQwtP1Ri7lwAypa0hf/VN91OAfADvz6myhrHxslCOx7xdqxE=
X-Received: by 2002:a05:6a20:12ca:b0:f3:1b6:f468 with SMTP id
 v10-20020a056a2012ca00b000f301b6f468mr19381338pzg.6.1682512843128; Wed, 26
 Apr 2023 05:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org> <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
 <877cxsdrax.fsf@kernel.org> <CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
 <87y1q8ccc4.fsf@kernel.org> <CA+HBbNH2fzr_knOE9EWD4bUi-guvRa07FAxc9WyCH0jK10BLvw@mail.gmail.com>
 <87fsafpg63.fsf@kernel.org>
In-Reply-To: <87fsafpg63.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 26 Apr 2023 14:40:32 +0200
Message-ID: <CAOX2RU5EaRrcKW7uhmDQbUO-TzOOnKAsx5HKtRjMDTMBEZj4tA@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To: Kalle Valo <kvalo@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>, Manivannan Sadhasivam <mani@kernel.org>, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	gregkh@linuxfoundation.org, elder@linaro.org, hemantk@codeaurora.org, 
	quic_jhugo@quicinc.com, quic_qianyu@quicinc.com, bbhatt@codeaurora.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, ansuelsmth@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_054046_480748_36C00CE6 
X-CRM114-Status: GOOD (  19.62  )
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

> Still not sure what you mean. Are you saying that this patch under
> discussion ("wifi: ath11k: use unique QRTR instance ID") also works with
> QCA6390 and it's possible to connect two QCA6390 devices on the same
> host?
>
> Or are you referring to some other hack? Or have I totally
> misunderstood? :)

We probably have a misunderstanding, QCA6390 does not work with
("wifi: ath11k: use unique QRTR instance ID"), that is why we in OpenWrt
limited it to QCN9074 only so far.

>
> > so that is why its quite important for OpenWrt to have a generic
> > solution that works on all cards.
>
> I fully agree on importance of having a generic solution. It's just sad
> that it seems people who designed this didn't consider about having
> multiple devices on the same host. It looks like there's no easy way to
> implement a generic solution, we have only bad choices to choose from.
> Your solution[1] is racy and writing to a register which is marked as
> read-only in the spec.

I agree, this is purely a hack based on what QCA is doing downstream where
they hardcode the QRTR ID in DTS and write to the same register.

>
> Qualcomm's solution[2] needs changes in firmware and it's uncertain if
> I'm able to convince all firmware teams to implement the support.
> (Currently only QCN9074 firmware supports this.)
>
> Thoughts?

I mean, we need some kind of a solution cause trying to pitch using a QCA
AX SoC-s and PCI cards but then saying that they cannot use AHB+PCI
or multiple PCI cards at the same time are not viable.

Regards,
Robert
>
> [1] https://patchwork.kernel.org/project/linux-wireless/patch/20221105194943.826847-2-robimarko@gmail.com/
>
> [2] https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
