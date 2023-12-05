Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5528AC4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAHU7eaCBlI39ozh0R6aBBM9TQ93w/mO6MUe5IK1PzM=; b=DY+LtdMcpDSUBkZfTQnE6F8gCH
	MShARFwDZypgLFh0ne9jHWcyvZmlYCv8Gor2IgW770AYXx09eDQV8C1Iv3r8XoTtLmS2s/hFpk2vW
	Lv70dwXIPk2zKhYcTeUa/011Vne4Cugv84r7GPjTb1RYJKAtwSQfrROemQnzO3T3f/jWIo83V+Alm
	hKVt278gmG1j8Ot6PPL4j3EqJWC2446v/TTheLlG69j7yCItBCrBfWLzDq/42R+LwBT/6dd9ccanT
	5sZv2owWnw8xcfMUrMg8TsWGYdfVc11Osg22gZsin0Kg6/xk0O/Lbwd8mWu3XUR1MIyYb/qkZDgqW
	Uk/7d6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUHV-007LrM-1b;
	Tue, 05 Dec 2023 12:12:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUHT-007Lqz-0H
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 12:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E67B1616DC;
	Tue,  5 Dec 2023 12:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CEDC433C7;
	Tue,  5 Dec 2023 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701778321;
	bh=nLgQGBeI2XeCWN90GqkIXr6vgWuvlpYecoMHP8u9Yvg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QdMR/qyf6bejxOdKpsyYiUHqt8wVABM6BdhucFkQ6P7Bq58pT46k8obKKYXXXIYbe
	 jXectM3K7BjTvpbVa1xXOYxhaFIBv6KPBDctDReJmuNwsBmZ++YSwlK+lpRUUa/Fko
	 ljAXYA7I/irWrG7hQE+1jJnn+8twfGbUDGPdma1hCBbeBj4rXKVabny1HmbNhPxp0Q
	 QM4+PkuohVeMrJpkxa/aVoP60+Y8+iSKthPGcDQ3gLL/Ljmf2UVoffzBA2tadhOBIc
	 2TlbBnEV1+PoSmYGkfWSaYpSJajGeU2wHfTxogxCYajZGlWhocZHm8XylCWixuHL5/
	 bfoOmVk5V5qaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Fourhundred Thecat <400thecat@ik.me>
Cc: ath11k@lists.infradead.org
Subject: Re: bizarre network problem on kernel 6.6.4
References: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
Date: Tue, 05 Dec 2023 14:11:58 +0200
In-Reply-To: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me> (Fourhundred
	Thecat's message of "Tue, 5 Dec 2023 04:13:23 +0100")
Message-ID: <87zfyoq25t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_041203_168048_6E35B6C6 
X-CRM114-Status: GOOD (  10.99  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Fourhundred Thecat <400thecat@ik.me> writes:

> I have the most bizarre network problem on my laptop that I have ever
> seen, and I don't even know where to start:
>
> This is lenovo T14s Gen 4, using qualcomm driver ath11k_pci
>
> Previously I was using kernel 6.6.1 and wireless network was working fine.
>
> Now I compiled kernel 6.6.4 with identical config, and when I boot it,
> wireless network does not work:

Did you verify that booting back to 6.6.1 fixes the problem? That would
rule out that this isn't due to some external reasons (user space or
network)

If you can verify that 6.6.1 always works and 6.6.4 always fails I would
just try to git bisect the issue. It shouldn't take too long.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

