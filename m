Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67ABEB64DC
	for <ath11k@archiver.kernel.org>; Tue, 11 Jul 2023 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5+yqWsIBXWFsYn5lO7PJWthjxrayBWKBnAY/HbfCFU=; b=IMSeLNBWfqh7yr
	Q4ZeynL9VPdOGeoyI7CQiL6tteiLh1xeUst1jzSh8HHsYxm/x+ftNFcun0yhdIRB+SClEaSXgxwke
	qb53lkOMOuHBqlcGSIj0kWVn/NY5bbzf82dwCPGo0KiVcdaoomzxUrfol0+Jf1SlxhXefkX00eQ75
	nGBDVRk47q/KQHhmROxPnrDBkTeJBjmn2IyFcKgUibSP/iiK68/EZzOwifqtDiSEW3rap3if4Yh6T
	DHboyQrTuxuzhCF9IeNkCxc+LvYGj2tuHO2IaZESE1tKNkUjOnBCcSp0r431ytcCchSZi747heK2P
	NW6WwaU4TkP6z5ZnlPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7J7-00Dvls-1s;
	Tue, 11 Jul 2023 06:57:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7J5-00DvlG-18
	for ath11k@lists.infradead.org;
	Tue, 11 Jul 2023 06:57:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99CA961325;
	Tue, 11 Jul 2023 06:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440CBC433C8;
	Tue, 11 Jul 2023 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689058626;
	bh=E7aOphHfxIvPiM7w+nvQL4QDcpx4xw+fA9HR0KeNyPM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WPqcmstoqnpoSua2xZYMl8b/Foa3vObKoL/CfIEEGmdcjP41UxX8YjSUGden4yoa1
	 OuRcJDjjSw+OVzeef0RSM+OQevEEfQh7nZkMqdh5QryzRfEuA9tsADGad1qgLNb85r
	 h2iKYhakcg93jeHbTh5KDuhWnpv8wMjaBJjgPm0BrEuM0V3XCKhCNbirIffDf8HKAS
	 ngmp+PADfCp/0hCKBJ9wEOeLqSPoV04XR6W6Hk5NgZ7bYNINvoogurVXLFBk7N3m0t
	 ++g5BEc+Nid+wSpUr147Y1YWBvhVfZIU7HLHOws9jiSrZBcp+zg+q1IObiEavc3nPk
	 iU21U0XNChTRA==
From: Kalle Valo <kvalo@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,  Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>,  Johannes Berg <johannes@sipsolutions.net>,
  Jakub Kicinski <kuba@kernel.org>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Atheros 11K
 <ath11k@lists.infradead.org>
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
	<6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
Date: Tue, 11 Jul 2023 09:57:02 +0300
In-Reply-To: <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info> (Linux
	regression tracking's message of "Mon, 26 Jun 2023 14:49:32 +0200")
Message-ID: <87o7kj7x6p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_235707_425782_0CF72A60 
X-CRM114-Status: GOOD (  10.56  )
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

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> Hmmm, there afaics was no real progress and not even a single reply from
> a developer (neither here or in bugzilla) since the issue was reported
> ~10 days ago. :-/
>
> Manikanta, did you maybe just miss that this is caused by change of
> yours (and thus is something you should look into)?

No reply from Manikanta so I think I'll just revert the commit. I have
assigned bug #217536 to me now.

The wireless trees are closed for July but my plan is that I submit the
revert directly to net tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
