Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA14CDB474
	for <ath11k@archiver.kernel.org>; Mon, 23 Oct 2023 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPdWV3wbuhRC4sBxC1ZW+ZNscPo+d84sGapigVbMZRE=; b=hLgdEse+IRMW7A
	9p2xrCd5Y9tWPi3H5oLdOdPos/Bk4Hez0Upw+PncMI9IpIi+pCvyyVlBrSIIO35vgJSVjxU7VWTON
	q3JL9AYsgZ+OFkRiEH6XMi8IfGlDx4aC1EqYwlkQNu/zDJAn8XKJ1GIiSnXh7YYmTw1a3pOyrMhzL
	8T+kQQ0Xzw7ei8IjOLdFDSg1AGuDFOijYM/0XGC8yRe09Wjgny+JOzJ3LaITKsq6AzFiOU5KU53kk
	wZKbkrmma+A6VGx0dyKtKhnvjJwzxhT8IFi4+LoC52N2hyd3oJ+A4BvU3k6Sv+/n88MCrgA9eW4H4
	xy2ky6ryICrwokH5qQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quq7P-006jG8-1d;
	Mon, 23 Oct 2023 08:16:59 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quq7M-006jFf-0y
	for ath11k@lists.infradead.org;
	Mon, 23 Oct 2023 08:16:57 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id 353C82319D; Mon, 23 Oct 2023 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1698048962;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=qIaztcP/xF/6FQAfLgNyVwpP7Qhu2E1a+Kbv0MbaUxJsDChRF9L/n8UdOXNVQfJSw
	 DwlnyjXRGBDm9+tC3kOmGcdJIDpN/qnpDg1oEa2YtJ319vDTW/HcGTrJd2ImVZiJ6C
	 MT4JJ0E9BGuhqacxgc+wsvNx7oCoKlulJQ0SfjkA8fS43oKbXtXAjfRZMdXxzsiJhM
	 Yjr6H+Xme5XKr4Cad62bd5gltIjwgu6AkXoWdfGiH87d/OagH6okQN/BCca2tJcIMo
	 e+nRh6d7Plb/BKB9eTPz43eQSPWmNHo2dvNxUQRL2xgKiYcSR6wOPOA8hAndqTGXud
	 BxGanhk8DbfNA==
Received: by mail.commercesolutions.pl for <ath11k@lists.infradead.org>; Mon, 23 Oct 2023 08:15:48 GMT
Message-ID: <20231023064500-0.1.9h.1vtcx.0.iyfk7mcezc@commercesolutions.pl>
Date: Mon, 23 Oct 2023 08:15:48 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_011656_502851_1C4F363C 
X-CRM114-Status: UNSURE (   0.89  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKUG96ZHJh
d2lhbQpLYW1pbCBUcmFsZXdza2kKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
