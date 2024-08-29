Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17757CA0EC0
	for <ath11k@archiver.kernel.org>; Thu, 29 Aug 2024 21:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeaSN8E3w6ydL8vyCtJZsthyAtOM1e6v6sqoYgfqL+o=; b=OwjsQ4zFZ9bshua6c51hM8/Fzp
	KwyZqLNaipWJlRscxCj8Cdzcdhu/bJP7crFkgaoz8jjyYwtdlMGvNAAR4sh9Il2P1Sf/dG8AREN0i
	T7tH3patpKL0k095ENDU0ZkMrw+Wj4BguSk2iwf35kzMCJjPkJbJdbxE/82aJnG5ke1KCPZhDVk5a
	FZ03/+voq43R1mTs9nCjAxCpr01aTsgiU98gObvNSCT8tcVBO8wpjWqZ4/HOnJEor1tHdh7oMlMrO
	T0C4Lopa0/pcebvZdCDJiD23MKgKWoIk4wG4VNaMca76Mo0k5HXDTPv4NmOeV1VbpwqI1sELQzqWI
	sPDoqBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjmlJ-00000003hqd-108a;
	Thu, 29 Aug 2024 21:33:01 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjmlF-00000003hp1-1H7W
	for ath11k@lists.infradead.org;
	Thu, 29 Aug 2024 21:32:59 +0000
Received: from [127.0.0.1] (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 97A6520A9C;
	Thu, 29 Aug 2024 23:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724967172;
	bh=oeaSN8E3w6ydL8vyCtJZsthyAtOM1e6v6sqoYgfqL+o=; h=From:To:Subject;
	b=KVLCNsFsqG6GZGK6MxiLcqa1OeX3auhWCS2ZQzwiIX1S55Tc1KuqjxFQQZ7CZodYb
	 GRX7NA5hoVm10YgU3E+F6LD2rH+QC4ynpXVYKH0gR1IssC4NuCBn889ZNmGUTOaNd9
	 Y0UNsz5CApqv+oZ1UWy2vxfG5qhC1zzfX7ZOuPmmjRtpKjdkk3Mrv0ONX2hfscQKXY
	 lQtQqtCfQkDcLUc8NF4Jts03ANpOnIJNhsIDeF5lG+nNj3yBX3qIFMWOcHluZzetQD
	 encIfp4AuOYp+dV4mloIyr7lwaTxKDVSqhz74G1Z57/wRLxZ48y5kfAArFpisbnnD1
	 /7JFExadYKidg==
Date: Thu, 29 Aug 2024 23:32:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: ath11k@lists.infradead.org, kvalo@kernel.org
Subject: Re: Silex SX-PCEAX BDF
User-Agent: K-9 Mail for Android
In-Reply-To: <20240829120037.GB30406@francesco-nb>
References: <20240829120037.GB30406@francesco-nb>
Message-ID: <E612F5BB-74F8-4B84-9127-55AF533DE89C@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_143258_266062_818408B5 
X-CRM114-Status: UNSURE (   2.96  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Il 29 agosto 2024 14:00:38 CEST, Francesco Dolcini <francesco@dolcini=2Eit>=
 ha scritto:
>I am using a Silex SX-PCEAX wireless module (QCA2066), and I would
>like to understand how to get the board file merged into the wireless
>repository

I mean the linux-firmware repository=2E=2E=2E

>


