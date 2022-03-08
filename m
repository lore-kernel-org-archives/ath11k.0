Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97D0C4332F
	for <ath11k@archiver.kernel.org>; Tue,  8 Mar 2022 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhNfXP3jxusR5R6a+C2hrdlscntuaL/PdhMYDKQQIdE=; b=glXn3Zh0PAx84B
	jLuu954dicVaNo/0NbBCib9MZJkxZWhwMPBD8wEBdHEbCwRC5JYcZFVpQO0leBI29jamLku5E08M8
	wCrB8bcd75IOQK4YDyeX5W6zYrHRKveKVQU8mJL2Xt551Weu6Dzj9a0c28vVnFhdceHgpZVKH/eVH
	QWZsP3b1ma/aRAMZL3z+zbbwKoP+hfkTkv2S/5Bqku0u67v4a3Ca9+DyJgVLNxyiXwaq9z3mHFz2R
	0MJ6LJndC8BlVajkQsDcr5SoegI2iWrXiX/Xrg97QnVfgU3UcQvp948WltN8GOdpqRv5YA4hV3NH9
	j+j4vCw0slMx0xaVlL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWlv-003jUo-Nr; Tue, 08 Mar 2022 10:08:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWdY-003gAe-6x
 for ath11k@lists.infradead.org; Tue, 08 Mar 2022 10:00:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 653F1614DA;
 Tue,  8 Mar 2022 10:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A211C340EC;
 Tue,  8 Mar 2022 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646733610;
 bh=i9OsW0AxWUwQAqlooc3ym6MdFnqZBd8K+5Fvlrk6mtU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ckuT8PXN7SFaIJqlzPOteFj+N41XPUi/lgSmPd73URwm6TZgybje+FEe++jWtUObn
 B0WKkxsEHzpzIdfW4TqdKsEbhtXvD/LFaSLzqXnlR1dR+0Vi0JWrcAAlXxLaEwRc36
 aMSFEtLBEBU5mopwbCP7GEenk9ts3TpohdI7eFUyQ7gDTXV+8jgaFi+uoZ6eiA09Dm
 1D7938BniNvXaWXOgVS8giW362QJ+FzLA5avakNRIHx6jo8PVU90RCYeo7ItSIvvlS
 zfjyxpRcTcy6rWrcDC84EyMxQVi/FHphI2oUziOCuHFdxUpp6CvtSW9MuRpSL3BtdH
 iajV0MXm1oyEA==
From: Kalle Valo <kvalo@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: ath11k@lists.infradead.org,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for QUALCOMM ATHEROS ATH11K
 WIRELESS DRIVER
References: <20220308071827.9453-1-lukas.bulwahn@gmail.com>
 <87o82gsvqf.fsf@kernel.org>
 <CAKXUXMwhMuUCzATH15GD7was8SkHqcYz-8swTMdE+wuE0yvknQ@mail.gmail.com>
Date: Tue, 08 Mar 2022 12:00:04 +0200
In-Reply-To: <CAKXUXMwhMuUCzATH15GD7was8SkHqcYz-8swTMdE+wuE0yvknQ@mail.gmail.com>
 (Lukas Bulwahn's message of "Tue, 8 Mar 2022 09:57:02 +0100")
Message-ID: <87k0d4sr17.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_020012_339159_B18EDA7A 
X-CRM114-Status: GOOD (  16.02  )
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

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> On Tue, Mar 8, 2022 at 9:18 AM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> + linux-wireless
>>
>> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>>
>> > Commit dae0978d4174 ("dt: bindings: net: add qcom,ath11k.yaml") obviously
>> > adds qcom,ath11k.yaml, but the file entry in MAINTAINERS, added with
>> > commit fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and
>> > ath11k") then refers to qcom,ath11k.txt.
>> >
>> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
>> > broken reference.
>> >
>> > Repair this file reference in QUALCOMM ATHEROS ATH11K WIRELESS DRIVER, and
>> > put it in alphabetic order while at it.
>> >
>> > Fixes: fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and ath11k")
>> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> > ---
>> > Kalle, please pick this minor non-urgent clean-up patch.
>>
>> Can you resubmit as v2 and also CC linux-wireless, please? This way I
>> can pick this up directly from patchwork.
>>
>
> Sure, I just did so, see:
>
> https://lore.kernel.org/linux-wireless/20220308085503.537-1-lukas.bulwahn@gmail.com/

And I see it in patchwork now, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
