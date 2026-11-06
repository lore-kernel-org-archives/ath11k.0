Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589C606A328
	for <ath11k@archiver.kernel.org>; Fri,  6 Nov 2026 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gN4lEFZE;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=hLcm/KUT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=goHBFdJc1I9ikTvKKpUhfylXuKu9IMDZPMyzXqJcLXE=; b=gN4lEFZEwjZG607b5MDfiJ8h2/
	YOJ8HJFyOGJXVqNp8YVRdqQs4tAIz1bxsv1dnTqeNKplL//KRTz2eoEYgAcLX+R0Q1Kt92HPfLgcz
	A/ED+ZO+18BfiONWGbCEJNN/xBCN7604k0hMehQsLy1+PCaLFVdlueyb7r00mdSQzOhmG/wmLb4oN
	brD5GAP7etIx47Uf52iiBfMiFBEwD+TDthJgDUAiB6ENlgIiYIPRYnIsANsZ3oRULxWOhTShGyLeY
	0CUdj5fAYb/wVRkxkhYn6qqQh3whb2J/SD3iAabSv/y5GXK5ZryyJhjHcWiPDNdkXeIa73HpYVTk2
	pzWoJzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8IP-0000000AwtR-1wo6;
	Fri, 06 Nov 2026 00:59:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8IM-0000000Awsg-3AGL
	for ath11k@lists.infradead.org;
	Fri, 06 Nov 2026 00:59:08 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 588C680A47;
	Fri, 06 Nov 2026 01:59:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XY4Jum9Sge5i; Fri,  6 Nov 2026 01:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793926739; bh=goHBFdJc1I9ikTvKKpUhfylXuKu9IMDZPMyzXqJcLXE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hLcm/KUTmXhQ2QVfnCgFQYStkpwmmGPaQz6OruRIJIoAv189GbkQsXh/jQrER1eTB
	 KRwSuBXoQws5gVBiJ7zuFhXqdk6pkVa4XHHQdco7gqKCs8uo7IOAKIzv5fpuaogYuH
	 m/AtA+bA9OtE49IOQaokNqSlBQoGxp741Seo16Ws/BM2pfHfNOF4ie6PO76q89RLyH
	 GYGF6GNMgwNmvajnUtRE+3I1VU/AsPJENCcW0pKHhfJugWXE6odL6DmGp6uPlKr1w2
	 AxDGPr2TSSf6YkSxRwbinvdI7DYzQwKW0CHvSIdvN5YK4YkbpZ2KjqkQs6+5c1Os1b
	 aH8KxuuUwAqeQ==
Message-ID: <2ed89d0f0114df0dc798dcc7dd1a6a4bd2d1fb7e.camel@disroot.org>
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath11k: firmware crash recovery
 fixes
From: Florian Maurer <fmaurer@disroot.org>
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Baochen Qiang
	 <baochen.qiang@oss.qualcomm.com>, Vasanthakumar Thiagarajan	
 <vasanthakumar.thiagarajan@oss.qualcomm.com>, Rameshkumar Sundaram	
 <rameshkumar.sundaram@oss.qualcomm.com>, P Praneesh	
 <praneesh.p@oss.qualcomm.com>, Kalle Valo <kvalo@kernel.org>, Muhammad
 Usama Anjum <usama.anjum@arm.com>, John Crispin <john@phrozen.org>, Sriram
 R	 <sriram.ramachandran@oss.qualcomm.com>
In-Reply-To: <20261101164716.302826-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
	 <20261101131550.1890062-1-fmaurer@disroot.org>
	 <20261101164716.302826-1-julius@bairaktaris.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 01:58:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-0+deb13u1 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_165907_216505_8840188A 
X-CRM114-Status: UNSURE (   6.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Julius,

On Sun, 2026-11-01 at 17:47 +0100, Julius Bairaktaris wrote:
> I will run your crash 10-20 ms after "is now up" against v3 on my
> AX3600 and post it with your three patches on top as one series, with
> your From: and Signed-off-by kept and your Tested-by on my five. Is
> that fine with you?
>=20

Yes, sure - thanks! I'll also test this again as needed.

Thanks,
Florian

