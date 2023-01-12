Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DCCC54EBC
	for <ath11k@archiver.kernel.org>; Thu, 12 Jan 2023 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+5hFBW9+0rKm4LTyB3AJV64L2fbdRKuDrsVL+16i8E=; b=RYitEWVCqm81+P
	NkoYQn2IHzu8Xh6JWp2tPU1uoQX9ZEQBvMn/zmH+jMl0m9vuREmUpbz26vShZ0rK98s9t0SruDJ9T
	7dOWzwlxRPMUEtsIms1d13oi1zJ3oLADn2j06lCYstf/zc5Zbb9U2uU9prIXjBiNtEM9oTKoi1aXR
	fQrEsCS5P+tQgdkLOcssanv3BW+uIlTZUzyITaQRmmqbDwMfq+GpmO3HhTBsR5lKU3kwVEsH0yg/D
	8n/9sQVzfEFDzA3pNLmH+9g+mnRTrI0TOgCIGl3cholc9320lhuTlGyCsJRwyz+l3hIP9Matxdndd
	MlP8F3W4lkkeJ2W1npJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuCr-00ERwq-WA; Thu, 12 Jan 2023 09:49:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuCp-00ERvR-NL
	for ath11k@lists.infradead.org; Thu, 12 Jan 2023 09:49:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49310B81DBE;
	Thu, 12 Jan 2023 09:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896A9C433EF;
	Thu, 12 Jan 2023 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673516945;
	bh=K4sEkNSpKTq3237afOVAYuzESNTvUDb/uVoy4XVOHkM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bdyodrY9SMNqvr6mxwhBmrVJtHWDDIF4h9q/E06/zz/PKt1WwbhriFbFOhcD9PMPw
	 OPQmktJS60bKr8GuDnqbRhYLRg6xeTX9bmbzvS9vUTEWDJnLM/RH/6yTha9N2rLJxI
	 fzHIKoiVQ4Fv9OjliJXR6a8BvXa1GFTkLdSv+jW+P0V6A9eOx9zPDgBv938Ths5fht
	 gWwKo/vLlgnVpO+gzihTwYR0oUq4LPe3AYCAm6ul/YQLs0oVK35LXbNyaRpn0cYsS4
	 UkoQUyfIkmc+5MOpWPVGGbP57gpy0uj8XTV3TUHfOZaA4Fde7BsA9teyD8q+sHOO1B
	 hoB+YKeNls+Pg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Manivannan Sadhasivam <mani@kernel.org>,  Robert Marko <robimarko@gmail.com>,  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  gregkh@linuxfoundation.org,  elder@linaro.org,  hemantk@codeaurora.org,  quic_jhugo@quicinc.com,  quic_qianyu@quicinc.com,  bbhatt@codeaurora.org,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
References: <20221105194943.826847-1-robimarko@gmail.com>
	<20221105194943.826847-2-robimarko@gmail.com>
	<20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
	<877czn8c2n.fsf@kernel.org>
	<CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
	<87k02jzgkz.fsf@kernel.org>
	<CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
	<87358hyp3x.fsf@kernel.org>
	<CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
	<877cxsdrax.fsf@kernel.org>
	<CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
Date: Thu, 12 Jan 2023 11:48:59 +0200
In-Reply-To: <CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
	(Robert Marko's message of "Thu, 12 Jan 2023 10:43:37 +0100")
Message-ID: <87y1q8ccc4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_014908_113743_B384BB87 
X-CRM114-Status: GOOD (  20.01  )
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

Robert Marko <robert.marko@sartura.hr> writes:

> On Thu, Jan 12, 2023 at 10:40 AM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Robert Marko <robert.marko@sartura.hr> writes:
>>
>> > On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
>> >>
>> >> Robert Marko <robert.marko@sartura.hr> writes:
>> >>
>> >> >> Really sorry, I just didn't manage to get this finalised due to other
>> >> >> stuff and now I'm leaving for a two week vacation :(
>> >> >
>> >> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
>> >> > and the current workaround for supporting AHB + PCI or multiple PCI
>> >> > cards is breaking cards like QCA6390 which are obviously really
>> >> > popular.
>> >>
>> >> Sorry, came back only on Monday and trying to catch up slowly. But I
>> >> submitted the RFC now:
>> >>
>> >> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
>> >
>> > Great, thanks for that.
>> >
>> > Does it depend on firmware-2 being available?
>>
>> The final solution for the users will require firmware-2.bin. But for a
>> quick test you can omit the feature bit test by replacing
>> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
>> "true". Just make sure that the firmware release you are using supports
>> this feature, I believe only recent QCN9074 releases do that.
>
> I was able to test on IPQ8074+QCN9074 yesterday by just bypassing the
> test and it worked.
>
> Sideffect is that until firmware-2.bin is available cards like QCA6390
> wont work like with my hack.

Not following here, can you elaborate what won't work with QCA6390?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
