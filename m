Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F19C54EBD
	for <ath11k@archiver.kernel.org>; Thu, 12 Jan 2023 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYA9hKWj2SMGDGYeO2Ao2iM4pWK3IJDYy/Xtgm+Ft7M=; b=KYQsKUrkE3OHNp
	wTQYdos+Q3qkOGoEn7I/wzQWh+ZZWDXW3k722DpsBXfJGvxjIgfVijDpujIQVQ85U+LX8imMcU9ug
	G8WELTKau0yXW/2OVbuHs2zIf3Rdnh98WAwaav4/Ul/eYwf73qCJkEscKfrDNN7/rFHel8tyOxbd+
	gcXkvMxTPNmYDbSVZGHMg4aB/JNAbyfLakECKsOIpddWXClU3bSAmwt6tW0BguJ8NH40GWVgblEy4
	sX+kS3PmBemM8i6FOMVS3GP3nYxkeJoA9XbuE3J00cDvXQXgCANUG0NAi9h1AQPkOW5rf209UknrW
	mwSKqjjOnTMC3GLyR99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu4Z-00EPpw-FT; Thu, 12 Jan 2023 09:40:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu4W-00EPpI-FW
	for ath11k@lists.infradead.org; Thu, 12 Jan 2023 09:40:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 217C561FC0;
	Thu, 12 Jan 2023 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D73C433EF;
	Thu, 12 Jan 2023 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673516430;
	bh=SCtzrnBNYnhocbWJE9NRFOmFwapY2gNywzGDKeHtHEc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qHZbYqFjTpM/FZ6AmwD+/w8oBegPrJpSdNscwGTK3e+2/+kTqP/6+qHgemqB7Y0Gq
	 CNDTpp7dN2MnTP+LLvotqldVq0jvzUm6PSuHqp6Spgv38hq00m2ZXBVrZgTr8utPfe
	 NM7tjjJeupSXzWMm/Kc3UXL1zfuHTxwBOQq7WqhudZkosTRvWkEuC+l+A7Sz67iLeJ
	 PDrr4Qy8YGYrObtHq48dCulgFtWkyKMd6hg9SLCgvmQWcLHBpn1FpLEjkHg4Cs0d7G
	 vDXW550ll/hUyAyQc1mufcSGwKSEzDqxNUBNRvjtkZCv1g/avQ/IOgEezfBC1hwzZx
	 FKpVpZ15lS5Yg==
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
Date: Thu, 12 Jan 2023 11:40:22 +0200
In-Reply-To: <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
	(Robert Marko's message of "Wed, 11 Jan 2023 18:10:38 +0100")
Message-ID: <877cxsdrax.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_014032_577432_B7C36D40 
X-CRM114-Status: GOOD (  16.21  )
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

> On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Robert Marko <robert.marko@sartura.hr> writes:
>>
>> >> Really sorry, I just didn't manage to get this finalised due to other
>> >> stuff and now I'm leaving for a two week vacation :(
>> >
>> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
>> > and the current workaround for supporting AHB + PCI or multiple PCI
>> > cards is breaking cards like QCA6390 which are obviously really
>> > popular.
>>
>> Sorry, came back only on Monday and trying to catch up slowly. But I
>> submitted the RFC now:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
>
> Great, thanks for that.
>
> Does it depend on firmware-2 being available?

The final solution for the users will require firmware-2.bin. But for a
quick test you can omit the feature bit test by replacing
"test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
"true". Just make sure that the firmware release you are using supports
this feature, I believe only recent QCN9074 releases do that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
