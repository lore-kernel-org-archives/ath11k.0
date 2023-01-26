Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FEAC54E94
	for <ath11k@archiver.kernel.org>; Thu, 26 Jan 2023 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0inrjKNHJQ5uCpEF4VnemhoV7oOspCKR5F5qddFinA=; b=wpUxX1UHY/iPQ7
	SoqK30rAvOOOsxIPGaf4Tk+8plBOxZ+ka5o/4ZTMJQkZH/UQL3lgqYMF9gCD8AN0hDFObOuePO2yc
	r49vMyTVVxmd6PXQOXChJsKDbGaIjBrOn9Gz0s6wGW9UlMIhaLEIfbz+ztHs2BnyFUolGrNrNmVn+
	7RtXvsnj7w4HfLlc42OiBeu9jvjC7Upcf2k9RP5cRJmXGjorzctihAUAlJft/8TmIAkjLp77MTVQA
	mrh3in5dOjqkg2esePLS14xmC5aMVlqHAM6+CgcrtBwD7RphkfqEZf4DH0lQ1A9TdMJPyXoW1V/RG
	TNPuhOmKYJCbZNHiuvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxwz-00A6SE-VC; Thu, 26 Jan 2023 08:49:42 +0000
Received: from mail.celldrum.pl ([192.71.213.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxqW-00A3in-KP
	for ath11k@lists.infradead.org; Thu, 26 Jan 2023 08:43:02 +0000
Received: by mail.celldrum.pl (Postfix, from userid 1001)
	id 3E2E94240F; Thu, 26 Jan 2023 09:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=celldrum.pl; s=mail;
	t=1674722551; bh=L9MaVcgJQNU45xvlWi+RdqvfUk7sPEb4wFjeNQOGJzM=;
	h=Date:From:To:Subject:From;
	b=iPMaC5TpLilue/CNeeEobfrG4xlRvtuT58PNhYAntMm7kaoMf3b27oBLA20dY+RtI
	 BmKm6g05i6oG1Vug6AqQTnX4Fygjnm/mPio+Gb1STinljqMeqQFK508f2r6YOZrdAJ
	 qY08lj7g5+VfKSUJV6lOC1bpTlLfDPqcI/M7BNGZvgMewRoDlabNk0WjPYXIT7DwvT
	 ga4uOIn7Ab9w8G/5tpsfrFwDkUbLndT9AK8JgVgDbXiEyN7ovy0Fpq3ALZBxUjDF78
	 hAVZWkhfzxawUu0kGxIiZj3fVnbZmxKiuwlN9J4Wg7ZfjJBmKHwhUqnUIKptoVdP20
	 eNsxhHkt0QIqg==
Received: by mail.celldrum.pl for <ath11k@lists.infradead.org>; Thu, 26 Jan 2023 08:40:06 GMT
Message-ID: <20230126083002-0.1.5u.b8yh.0.5w3qqgm437@celldrum.pl>
Date: Thu, 26 Jan 2023 08:40:06 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Kamieniecki"?= <pawel.kamieniecki@celldrum.pl>
To: <ath11k@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.celldrum.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_004300_940990_6045C0D9 
X-CRM114-Status: UNSURE (   1.39  )
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
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpQb3pkcmF3aWFtClBh
d2XFgiBLYW1pZW5pZWNraQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMWsK
