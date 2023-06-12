Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12ECC7EE43
	for <ath11k@archiver.kernel.org>; Mon, 12 Jun 2023 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPdWV3wbuhRC4sBxC1ZW+ZNscPo+d84sGapigVbMZRE=; b=dmsnVF/jTlaBJK
	WLVbguIMn7w/lMQTT5SDnGcFQGbZlQR6rTFofIKX1/IaCDEw7dwF8L8bAftXL2Xn/De52KzubTZTh
	rorY5enDlQkF7ulS4AyyU6xgigS8pcsAQwjNd0ZrAvXaE1pymWdJYpx+obzVCq7Cx5upTLRr0+XAp
	B4/grzk+hoR7K6lp967NCbdm211AO+72jprMio11K8DAVuc7KR/Yk8qB7/KcS9Vaqoq5pZxkdVh6T
	ZsI1n/I+Q1aUceEFMtfXfQ8ivriMNQaG8zgl4sNzJ78NTWobE8tLC/6WZK1TZMvVarYHuMqcgAZOz
	Yhi9fZuN9+nU9DQBMZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8cQ1-002zUa-2F;
	Mon, 12 Jun 2023 07:56:53 +0000
Received: from mail.craftsplex.pl ([162.19.155.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8cPy-002zSl-2Z
	for ath11k@lists.infradead.org;
	Mon, 12 Jun 2023 07:56:52 +0000
Received: by mail.craftsplex.pl (Postfix, from userid 1002)
	id 5494922C24; Mon, 12 Jun 2023 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftsplex.pl;
	s=mail; t=1686556604;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=Rr7ZokSTlhcEuMO9vdmRlZQppbjov1lBPCEDAUsA8pb14vAm/emyc0CXFTh6cD4WO
	 k9K85mwKhqvNL+FsDpw83ytG6ExOKInicS3lHZL+TuAjetZ8USEfKacmUHbwzssocm
	 0PZMjG+I/vEQgFYul4UwrbnGpxikEXJsRPNbR4mVNvzhIhpwkAXzpF7KQ/d8X7jgHk
	 Y5fyuN+1Ub737sMXk9WIuTMfajh+4kao5iDNJ6p4VniiNjraTe/oNPtJze3MDwal/B
	 JCFuwjjCQkVrthWAdGyv9KM1xep7nrvimV/aFjZU9+n9Iu+fWUpM9qBHKefW3RCzhH
	 0aToli6LKv72Q==
Received: by mail.craftsplex.pl for <ath11k@lists.infradead.org>; Mon, 12 Jun 2023 07:55:44 GMT
Message-ID: <20230612064501-0.1.6n.10z5x.0.hi54k00qaa@craftsplex.pl>
Date: Mon, 12 Jun 2023 07:55:44 GMT
From: "Kamil Tralewski" <kamil.tralewski@craftsplex.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.craftsplex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_005651_092603_EB0E417F 
X-CRM114-Status: UNSURE (   0.86  )
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
