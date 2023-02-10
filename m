Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF74C636CD
	for <ath11k@archiver.kernel.org>; Fri, 10 Feb 2023 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/hdHfjQC4OT8w6YVigz8bpZ4VuIOhlHIB1TFZyaERw=; b=30mD0OicYZN9uh
	Sd2E0sJaQTAqkCzqTjf/Lt2Ivfo0/e2/9qJ3bNopQo/Qench2PpYrZmgtVaFE+cK3g2OgDMJyyKOM
	BaeKfuBcW3yi/z+DmBvmKbCNSDCzj+Loka4qy+tX+7YNHC5l4t6YyyyEoOrBhlNApiMi5l4OsHe8O
	e9SFIjpCLXD+7DCrDrhD9btmhDNQ3zs90ut29xVObmKyVQqGACJ2gLU6S4FYcHTzWvrF9O8+KkC1s
	hV+c7hcHLiqH5R239AmcfTJ9aVClOvs/lggcT6hRP+aD2Alxk5d4GSrRgnnOLMI3KRoiCoVrFj1yu
	ff41hMoEcQOttPPsTYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPD4-004rvL-Ax; Fri, 10 Feb 2023 08:56:46 +0000
Received: from mail.culbokie.pl ([217.61.97.164])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPD0-004rrA-JS
	for ath11k@lists.infradead.org; Fri, 10 Feb 2023 08:56:44 +0000
Received: by mail.culbokie.pl (Postfix, from userid 1001)
	id 5169C827FC; Fri, 10 Feb 2023 08:56:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=culbokie.pl; s=mail;
	t=1676019396; bh=cNbZL9WXZbgcQtzgDCharPn7EQBjUHnC1FAZ/+OQVjk=;
	h=Date:From:To:Subject:From;
	b=z7m42hIZbAdmwBGWH8gwgppNgN4fX45HZN5cC7cAN6KmmCvvyJag2Bj6SzBNnHQxR
	 wgPmbxucwxa1FsRW3I/HjmmfVjjzChCpo8REh2sqtYgEYcZYQxmVHh3kSxqi7z8NEe
	 euPHKLBQgq66/s6boSzyYS/v0VUokF/CU9JzcImSJOg4A+fJBJqGj7rNRlzwYIyAI4
	 k4Spf8B3b+VzfJYcs8QmDuNBHCBUV85yEoPvtIi3QBB8C3ZRcIfKHDqGsoFiUCAfdn
	 QI6qFkqzDa9jP/0QwIKHdo4CfWiwAptGmmwcZ0Dn0F+7Biro7YihHF8A8f+0RTDz0A
	 MKM3EEfx7X4TA==
Received: by mail.culbokie.pl for <ath11k@lists.infradead.org>; Fri, 10 Feb 2023 08:55:31 GMT
Message-ID: <20230210074501-0.1.1l.34r5.0.m1dc1bwc5l@culbokie.pl>
Date: Fri, 10 Feb 2023 08:55:31 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Kamieniecki"?= <pawel.kamieniecki@culbokie.pl>
To: <ath11k@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.culbokie.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_005643_136735_DFFF3092 
X-CRM114-Status: UNSURE (   1.05  )
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
