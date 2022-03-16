Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4462FC433EF
	for <ath11k@archiver.kernel.org>; Wed, 16 Mar 2022 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNh+DfwQR1bDV25fldW/NgtSp166KYnIsTSSPcHx5g0=; b=ea8SdtrhZIMqSZ
	bZdShFZO6QzR3xqLoWCPYs9efzDnICizkq4Fz9duiSW7uPXMw0J/o3QICgeloBXhNYOZjF/sgyYm4
	6Gd9PFO22qJGZ92mhBb7p2IlHOTQabQkC6TzNChcisq693DCkXQH6RWrHrNxGZ4JUaoqsbvuHPdUj
	aFr42R+8LoO8gzcQ25ps6/aJFWc23qGboBIXeaWEvPwp7Zc/DnFXY+1RsJbvV6EEdhLQemzL8WZ3C
	VPfrNS1BsXcL3K3KX30QJYr35k0aVlxxqHlQ2zN/n2TMZQMx+JqGk93LaDOgjNT1ErLy+9q6SGYX+
	2ZJh4yG/Kev6Xa8yvPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVeX-00DabG-N5; Wed, 16 Mar 2022 15:33:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVeT-00DaZ0-QZ
 for ath11k@lists.infradead.org; Wed, 16 Mar 2022 15:33:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CED8616E0;
 Wed, 16 Mar 2022 15:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60621C340E9;
 Wed, 16 Mar 2022 15:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647444808;
 bh=ErcNptfdS+iULWkDCthzkd1Qlz8XmSgG7d9SHtOVd6w=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=r/2kQFJvaZjB7AWFCs8Q52daB1EaPRTWtGum0gkBvfbiNec39Pc9qIC8IAJHvXAxf
 z500tjRlXwl3m5mhyjj12lJFItWBC+6vnYT+di/0gMA/ldgwVAeDQ7QJIxN9z2If37
 KALcW4WG5W/tauDlpQmJgoBsEhkHgNe6E+U4dPsfKidozFEi+m2durbnr6pyry5NC0
 XwSoIjFdAjD0UNZJdLit7d6XCaNMzWC1HPc4lEVFeKGTOJnQuOer3Rb/oX4OCJWSHV
 6A+TxwpXC/fJrQ+ui279dWTFNKXj/vyvyBMUNvrSvnnmO9Y94Ij043kjGE6YEf7Zyl
 gOCG1H1ch9RAw==
MIME-Version: 1.0
Subject: Re: [v2] MAINTAINERS: fix ath11k DT bindings location
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220308085503.537-1-lukas.bulwahn@gmail.com>
References: <20220308085503.537-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164744480556.16413.9130060448491474487.kvalo@kernel.org>
Date: Wed, 16 Mar 2022 15:33:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_083329_956775_EC2EE866 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit dae0978d4174 ("dt: bindings: net: add qcom,ath11k.yaml") obviously
> adds qcom,ath11k.yaml, but the file entry in MAINTAINERS, added with
> commit fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and
> ath11k") then refers to qcom,ath11k.txt.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Repair this file reference in QUALCOMM ATHEROS ATH11K WIRELESS DRIVER, and
> put it in alphabetic order while at it.
> 
> Fixes: fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and ath11k")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied to wireless-next.git, thanks.

5df2dc0087e9 MAINTAINERS: fix ath11k DT bindings location

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220308085503.537-1-lukas.bulwahn@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
