Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19667E78D44
	for <ath11k@archiver.kernel.org>; Mon,  9 Feb 2026 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4zNOX1rPNzdOvyDYsrogZNW43/DVQGIuouZVBp4+ec=; b=P8k0j1+LRZoVLEc5RMkrqFo74H
	9wvwhPRpBz/oyKh5A3bQ/3ukHH6DPJIfdTGvno1EXZ1pd9dV9FfgyYW7abyvgRmec9ZSH9u6t21vT
	oF3jOOK6m96+lbcazKIuN8v7rdWtRztAxxKzQUxzxJ8gPYu5nvzec+5P3tZDPTkDS001idWW2xlXc
	TQus7dDAh1IeiU1BPKYsy3zZ/kdjrlrvT7IA3lg4Let+QMaXcxJo2RSOQ3Keg3qw4Jd4+UifIxv3c
	Ef4AadV4DcdSPXlFtOhKDzQ7k4zHs5xWPHx43Kd2ZLn3/WFbSMgRmtk9TqBBmQPuXc4PgpDlRoH1E
	3l5ucUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN4L-0000000F4SR-02fi;
	Mon, 09 Feb 2026 08:56:33 +0000
Received: from mail.launchix.pl ([162.19.224.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN4H-0000000F4Qv-3pHV
	for ath11k@lists.infradead.org;
	Mon, 09 Feb 2026 08:56:32 +0000
Authentication-Results: launchix.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=launchix.pl; s=default; a=rsa-sha256; cv=none; t=1770627383;
	b=fArCYuSH5UyBjYvlUo/8entTObujyeEhkpYEYgqgbDNyDiydGVJdjPrEPPJiKz7K2IJK
	 4wJwec/qVqlpoZnYwbWj3ZJzSB3+tMoWDJ7v+mxzadzAzDuHDOVYStOBFJrl0oe7LTjZO
	 zOd8D0r4YZ6iQpEPLoZ4D/JwYfbOtUxuSKk2ANzLAMpMI/6yfadbvOJEwUhO3aLkZLR7g
	 6jym0JK+XaXxvexpgb4hauEGPkDgQB9/j0/E+l9cmyj3Q6B5r2cBEpqDAEKu/naiEk0cQ
	 +WMEA1aaab6nkbuqz2tWRQZ3MR359WWONETPNoya8kM4qv4Dnvr4Af1C1KaceSgOlDA==
ARC-Message-Signature: i=1; d=launchix.pl; s=default; a=rsa-sha256;
	c=relaxed/simple; t=1770627383;
	h=Message-ID:Date:From:Subject:From;
	bh=n4zNOX1rPNzdOvyDYsrogZNW43/DVQGIuouZVBp4+ec=;
	b=hqV6ecHZNT+PSmYFuISDoRCpka/MYilOeO2h5ujX6kOO+YWW7TdpX0t7/x4wiMmhFV4m
	 3JYr1IdHb/oTSu92gDBBljMnH7OrKoQWMPFb8bhWsuzdf+rqlg2QK/Kj45DhiZjo3k6fg
	 IblhqtscEMe8Y+GA2aCIrDEog/O0XDbKAZWUYixp7xt32+ZuWwHaCTDC6Fahqt0gCxuMY
	 svMcg0uA8JCEiRlF8Nd5MtZJNqScBfsYNfVHylXKsrFf4CRoqN0QQVhZjU9aAveRjfahV
	 SPPcFokVMV1/uNpWmlP6C3rDnbBWvqytbJ9A3ZjnOCq/sXSY8jSAT7E9mOswBSxjAvQ==
ARC-Authentication-Results: i=1; launchix.pl; arc=none smtp.remote-ip=127.0.0.1
Received: by mail.launchix.pl (Postfix, from userid 1002)
	id A51DB25255; Mon,  9 Feb 2026 08:55:36 +0000 (UTC)
Received: by mail.launchix.pl for <ath11k@lists.infradead.org>; Mon,  9 Feb 2026 08:55:18 GMT
Message-ID: <20260209074500-0.1.58.17di8.0.9hcdh20pe4@launchix.pl>
Date: Mon,  9 Feb 2026 08:55:18 GMT
From: "Adam Grzejszczak" <adam.grzejszczak@launchix.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Dostawa_sprz=C4=99tu?=
X-Mailer: mail.launchix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_005630_150619_329A3901 
X-CRM114-Status: UNSURE (   0.92  )
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

Dzie=C5=84 dobry,

reprezentuj=C4=99 dystrybutora sprz=C4=99tu elektronicznego i IT, oferuj=C4=
=85cego ponad 90 000 produkt=C3=B3w od 1 100 marek z mo=C5=BCliwo=C5=9Bci=
=C4=85 wysy=C5=82ki tego samego dnia.

Wspieramy firmy w doborze odpowiednich rozwi=C4=85za=C5=84 =E2=80=93 od a=
kcesori=C3=B3w po nowoczesne technologie zwi=C4=99kszaj=C4=85ce efektywno=
=C5=9B=C4=87 operacyjn=C4=85. Zapewniamy pe=C5=82ne wsparcie ekspert=C3=B3=
w oraz mo=C5=BCliwo=C5=9B=C4=87 przetestowania produkt=C3=B3w przed wi=C4=
=99kszym zam=C3=B3wieniem.

Ch=C4=99tnie porozmawiam o tym, jak mo=C5=BCemy wspiera=C4=87 Pa=C5=84stw=
a cele biznesowe.=20

Kiedy mogliby=C5=9Bmy um=C3=B3wi=C4=87 si=C4=99 na rozmow=C4=99?


Pozdrawiam
Adam Grzejszczak

