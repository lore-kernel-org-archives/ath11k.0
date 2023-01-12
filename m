Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A025AC54EBD
	for <ath11k@archiver.kernel.org>; Thu, 12 Jan 2023 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zObKe3wVsDdxv68/L1v4Bjj8f+kqkTcdJqDiQN0xtHg=; b=LEe3RMCNjQTrT6
	8R9Lv57Iih0/uITc27jmRuNN4m+uDVIhvlpdZcBg+O4O4HxhGNEdPCkIWbfSXq0VL1/bKChZKDLYb
	Ph6xlL96UblEgepjgkcv36s7/TWdogc3YSI/1cUJApjm14EGtEeF11JCp7XRoFWgQV6rCiZW39UlD
	wdP95GMGPNblm8w7m6ze8PU8YKcmYXhs2S8KP7Zb9IokMJ8taNvM9ry60mmyQKYQuIYFMs5AS34xF
	wtDWjBbkfTYYeYusC1q8pRhEm4gi5Hztl5rcmUSgXBDExpX5GhAqo03cwRdNup1pTTH7DqDhY0F09
	1/puapCATOYNAcwyOF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu7o-00EQdz-0X; Thu, 12 Jan 2023 09:43:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu7k-00EQb3-Ir
	for ath11k@lists.infradead.org; Thu, 12 Jan 2023 09:43:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id 17so19727255pll.0
        for <ath11k@lists.infradead.org>; Thu, 12 Jan 2023 01:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCnOI57UTMuZBY8ttuWaWyhOE2RAr35dNvKJuI2jpjo=;
        b=ygbcPKK4FYbKlI0784ZnOo3Y1vhA15ypnakMPlk672u1KjbUYgoAYZVLpiQ2CsCD1n
         pMeo6j6iE/90fiCxgCTTpAy5wkqUWqw9LE5VhJfDFor1q8M1aeZW5tV+XmSid6ZaPkoH
         BilQqYsq37+eAf2Ws9aLkY8HxoVp+hpJapgAZID6KWrJjz4mdj6rv4iJiD+1NNPTRF1L
         fLf5iznch9aVN9mjHJtbZUBtiroso/RJsPwAEjs+eyJWkekbsyJWP3DUnAtrXRudnR3x
         i0N54hDX7EgHZFV9L0UGmgr12AHpE3QGISYtuQ0DYCJpg5Cr/d8vUikXiQb3tXH3HPtn
         jLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCnOI57UTMuZBY8ttuWaWyhOE2RAr35dNvKJuI2jpjo=;
        b=RZ03PBjyyDifCvT1/bLK4430jYky5weChax+88+AvN72WA/93WEw8TD9G9V/jPCK2b
         1xxCEbmw6nZMkY3OcIv0BOsS7LmqGJJXI1qcP/WotWhKXomLlI+OQyOjjMNdP8MMig4P
         avvrnJ+sFU/+eWfXwdlh/EcLM+uE8o5qtcaDDxs60BqXJjxuVN378+vsHK6CXvzIC7oa
         ZMyTPJXatQRvB8UhWmwvpbgGLhQ1tGQ9EGQbi4mc5Yq3eSHmq3HUFWunjBnFeTShMdEo
         UoXCZxs+AIZCOxYsJCqRMUqZpWhWoRfhDLtiXqPyLPjyKb4NK6B+BcvQOSPLzGtkIxju
         ZZ6g==
X-Gm-Message-State: AFqh2kp5Sr0RHY4+bE1gMOBwyTil4lpllNwndniB7l3y2iaNPB0pzsyx
	aamj80HPZLe7U/1u3fqgh1ixRLL+/wIbKTtJDwKv0Q==
X-Google-Smtp-Source: AMrXdXueoMMev/WBFF9vUihTNyWPTMJxjr2hVS/wMKsdd4Z2hy1m7ecn34yBd4kpcw5X3go5dMJsCg4sMDlHq8PGPsU=
X-Received: by 2002:a17:90b:48cf:b0:226:164f:522e with SMTP id
 li15-20020a17090b48cf00b00226164f522emr3948204pjb.22.1673516628746; Thu, 12
 Jan 2023 01:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org> <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
 <877cxsdrax.fsf@kernel.org>
In-Reply-To: <877cxsdrax.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 12 Jan 2023 10:43:37 +0100
Message-ID: <CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230112_014352_683186_9D8EFC3D 
X-CRM114-Status: GOOD (  18.68  )
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

On Thu, Jan 12, 2023 at 10:40 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Robert Marko <robert.marko@sartura.hr> writes:
> >>
> >> >> Really sorry, I just didn't manage to get this finalised due to other
> >> >> stuff and now I'm leaving for a two week vacation :(
> >> >
> >> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> >> > and the current workaround for supporting AHB + PCI or multiple PCI
> >> > cards is breaking cards like QCA6390 which are obviously really
> >> > popular.
> >>
> >> Sorry, came back only on Monday and trying to catch up slowly. But I
> >> submitted the RFC now:
> >>
> >> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
> >
> > Great, thanks for that.
> >
> > Does it depend on firmware-2 being available?
>
> The final solution for the users will require firmware-2.bin. But for a
> quick test you can omit the feature bit test by replacing
> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
> "true". Just make sure that the firmware release you are using supports
> this feature, I believe only recent QCN9074 releases do that.

Hi,
I was able to test on IPQ8074+QCN9074 yesterday by just bypassing the
test and it worked.
Sideffect is that until firmware-2.bin is available cards like QCA6390
wont work like with my
hack.

Regards,
Robert
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
