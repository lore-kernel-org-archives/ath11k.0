Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32957C64ED6
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/hdHfjQC4OT8w6YVigz8bpZ4VuIOhlHIB1TFZyaERw=; b=hAG8uaFC41I6cf
	s+V0vxJa+6xdSpgJlPQcNUhxxw9S4yRs/iNBQ2i1CWJMPM7oz6tW8V6z3x+KBXcO+TzNQ9cjIXVqn
	w8BM6hle7l9jsFtnD6dCaTvDlXyfF0349F1TxqKUkipSlfTwGzjAQFkjeKxMk5Ii21GW8uHgxFprK
	+uL/eqzCEG13I2FuBeGc1qzx7pdDwqx9SxjT2lyh0WVsIQMbXTZroEEj+i1o6UWeWdDVgsHChgzZa
	6miXlPoFDADOr7ROqcjcpdOngQLV4SNxFtGnbXbh69rVbWHg1/4UXfWwSb9ueFsWdFiLhMrig5nRt
	Gx6gqWyGwypONrL0rk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaSs-009BL9-V0; Mon, 27 Feb 2023 10:10:39 +0000
Received: from mail.cannich.pl ([94.177.238.223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaSp-009BKO-K5
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 10:10:36 +0000
Received: by mail.cannich.pl (Postfix, from userid 1001)
	id A963D7F077; Mon, 27 Feb 2023 10:09:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cannich.pl; s=mail;
	t=1677492628; bh=cNbZL9WXZbgcQtzgDCharPn7EQBjUHnC1FAZ/+OQVjk=;
	h=Date:From:To:Subject:From;
	b=U1FPTwQ/MJyN+RcU1PjfUDLvQ7O84+pCndzOt70c/0FhOX24PU2m38tZWIUlDY8Bh
	 8TmzynWE5yos6IFHIwFP5R30zPTYwl+NnsWB0sCArK6hqEJgAjy7Wj3XpwssPGZv2K
	 5EjamukxrT0Yx52ZEjvRPoLssbnix2jxiry5IRdZLeoSzd+T9rxIC4EiJyKcBM7L+s
	 S1dC0T/H0xweV1l6o2PZ9ZO0sF43V7r6NnuGNX/f/zrD3PAlJ1Gmuci7n5I+YCpmiq
	 BUOS5ZJXdOwcEchLq715+9VeJoMLDoLBxAiVBmm5TLQVF9k7BD055bTseSxlnp7d+j
	 YLo+k5j6d5KwA==
Received: by mail.cannich.pl for <ath11k@lists.infradead.org>; Mon, 27 Feb 2023 10:08:26 GMT
Message-ID: <20230227095324-0.1.23.1at4.0.hmmni5qivo@cannich.pl>
Date: Mon, 27 Feb 2023 10:08:26 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Kamieniecki"?= <pawel.kamieniecki@cannich.pl>
To: <ath11k@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.cannich.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_021035_855155_7C2F8284 
X-CRM114-Status: UNSURE (   0.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdHdvcnplbmll
IHBsYW51IHRyYXMgY3p5IGRvc3Rhdy4KClogbmFzemVqIHdpZWR6eSBpIGRvxZt3aWFkY3plbmlh
IGtvcnp5c3RhIGp1xbwgcG9uYWQgNDkgdHlzLiBLbGllbnTDs3cuIE1vbml0b3J1amVteSA4MDkg
MDAwIHBvamF6ZMOzdyBuYSBjYcWCeW0gxZt3aWVjaWUsIGNvIGplc3QgbmFzesSFIG5hamxlcHN6
xIUgd2l6eXTDs3drxIUuCgpCYXJkem8gcHJvc3rEmSBvIGUtbWFpbGEgendyb3RuZWdvLCBqZcWb
bGkgbW9nbGliecWbbXkgd3Nww7NsbmllIG9tw7N3acSHIHBvdGVuY2phxYIgd3lrb3J6eXN0YW5p
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpQb3pkcmF3aWFtLApQ
YXdlxYIgS2FtaWVuaWVja2kKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTFrCg==
