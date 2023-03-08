Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E19C64EC4
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTg+AsqKU3YBSLLR/0kT1npdlVMIeL/DK6Bui4/ppI4=; b=Jh8LCpI6x8bSp2
	+z8ovTHcFDsUiJeN/Qc2plgMrlzWKsVfzTAU/0IoOUx2IOtl41abnS/jcKMmJVVfDmtlrdO/VdC6x
	VPgcN8p02UteY0MDQV82+i33FwFvA3vLeNUDrMI/AY69jmvqh0L+MeYUfhkOFZBltwfaaoOSklIW7
	Mu0Q6pp2F+NvByFcT0awBBw1hCDB7Opcpk7fi2yA75imdhcbRI/V3fTPL+atA9tT2tVu1Nmfjwkq3
	3RBvbUdiVzM1Ccl7I4v1WxSCBRvq9elNzJvXOnGCUSLXSApX84XqlYX4bM9+puNhUnRPXF4C4FzED
	S+jH6pi3JeAPhIiBVbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZt8i-004udX-Bx; Wed, 08 Mar 2023 12:43:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZt8f-004ucz-HF
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 12:43:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F21B6177E;
	Wed,  8 Mar 2023 12:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA996C433D2;
	Wed,  8 Mar 2023 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678279403;
	bh=DocI4dram1oaC2Qxu/FVDptKl4AwjtU4IjvD88IptJQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=S1OcYFQhrdN0g87cCs7ucc59mYtX+9rZx1K3co4u0/4mnfPQTJa0Htd86uTqQbJAd
	 E32xrPsntaL2VE59IPZPYKNFWQCweqb132+OzEfgrwxY6/2lqs4OBaVUba0wiid4hV
	 BFzc3w8ujd6hCct6aT3bFarUZh3vCioIQAChUi43k/slsd7Au3aa+10ug7n56GWSQh
	 JBMrDULJzkmOv5CzRJ1pfbPTrpo6aGEkXsnb2okTd66UHBZ0Zvv4rWZm/kK94TZW+P
	 E9BlraHJ4sayQuF7aGEo8bYma/UOlCWhJShBfMVy0wsZ/B+6D6N4tP+D4BQRWASw3O
	 IgYdgx7wNCvkQ==
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
	<87y1q8ccc4.fsf@kernel.org>
	<CA+HBbNH2fzr_knOE9EWD4bUi-guvRa07FAxc9WyCH0jK10BLvw@mail.gmail.com>
Date: Wed, 08 Mar 2023 14:43:16 +0200
In-Reply-To: <CA+HBbNH2fzr_knOE9EWD4bUi-guvRa07FAxc9WyCH0jK10BLvw@mail.gmail.com>
	(Robert Marko's message of "Mon, 23 Jan 2023 20:21:08 +0100")
Message-ID: <87fsafpg63.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_044325_689559_E4381AAB 
X-CRM114-Status: GOOD (  26.99  )
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

> On Thu, Jan 12, 2023 at 10:49 AM Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Robert Marko <robert.marko@sartura.hr> writes:
>>
>> > On Thu, Jan 12, 2023 at 10:40 AM Kalle Valo <kvalo@kernel.org> wrote:
>> >>
>> >> Robert Marko <robert.marko@sartura.hr> writes:
>> >>
>> >> > On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
>> >> >>
>> >> >> Robert Marko <robert.marko@sartura.hr> writes:
>> >> >>
>> >> >> >> Really sorry, I just didn't manage to get this finalised due to other
>> >> >> >> stuff and now I'm leaving for a two week vacation :(
>> >> >> >
>> >> >> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
>> >> >> > and the current workaround for supporting AHB + PCI or multiple PCI
>> >> >> > cards is breaking cards like QCA6390 which are obviously really
>> >> >> > popular.
>> >> >>
>> >> >> Sorry, came back only on Monday and trying to catch up slowly. But I
>> >> >> submitted the RFC now:
>> >> >>
>> >> >> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
>> >> >
>> >> > Great, thanks for that.
>> >> >
>> >> > Does it depend on firmware-2 being available?
>> >>
>> >> The final solution for the users will require firmware-2.bin. But for a
>> >> quick test you can omit the feature bit test by replacing
>> >> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
>> >> "true". Just make sure that the firmware release you are using supports
>> >> this feature, I believe only recent QCN9074 releases do that.
>> >
>> > I was able to test on IPQ8074+QCN9074 yesterday by just bypassing the
>> > test and it worked.
>> >
>> > Sideffect is that until firmware-2.bin is available cards like QCA6390
>> > wont work like with my hack.
>>
>> Not following here, can you elaborate what won't work with QCA6390?
>
> Our downstream hack does not work with QCA6390,

Still not sure what you mean. Are you saying that this patch under
discussion ("wifi: ath11k: use unique QRTR instance ID") also works with
QCA6390 and it's possible to connect two QCA6390 devices on the same
host?

Or are you referring to some other hack? Or have I totally
misunderstood? :)

> so that is why its quite important for OpenWrt to have a generic
> solution that works on all cards.

I fully agree on importance of having a generic solution. It's just sad
that it seems people who designed this didn't consider about having
multiple devices on the same host. It looks like there's no easy way to
implement a generic solution, we have only bad choices to choose from.
Your solution[1] is racy and writing to a register which is marked as
read-only in the spec.

Qualcomm's solution[2] needs changes in firmware and it's uncertain if
I'm able to convince all firmware teams to implement the support.
(Currently only QCN9074 firmware supports this.)

Thoughts?

[1] https://patchwork.kernel.org/project/linux-wireless/patch/20221105194943.826847-2-robimarko@gmail.com/

[2] https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
