Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFD0EE57DE
	for <ath11k@archiver.kernel.org>; Fri,  8 Sep 2023 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPdWV3wbuhRC4sBxC1ZW+ZNscPo+d84sGapigVbMZRE=; b=fM58DdP48bkYG0
	QkDyG+aNnyYz9YoQ1gJ1wnUuOhJsQd9erlvxFpuPFbZAS7rSfEiiltrE+j4koXRLPzlKIOIBHFCZr
	vV5HuXnk8axCGi1b2WufXsZnkB8N4pUYr3JTSblBrzZp4tOfH1IqhrQXB7ttYmH54kByyXmFLeNd6
	4ueYIxl9UtNIkOkqtvQ+DLWvFHaRih2cGwen14SQjKWpIuoEUX3eAWAl4VfQtTypWi3ETE4JbSc3R
	7eJJ37S/qoMEZj3F9Z03lCtiMNooa0wptX6pejaJxHyqCkKzcC+VDC/G+ByfmRe+PVWOMKtl0bBP3
	bArtQMztveBPMn/gfqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWMl-00DHV0-1Z;
	Fri, 08 Sep 2023 07:57:23 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWMg-00DHTj-0j
	for ath11k@lists.infradead.org;
	Fri, 08 Sep 2023 07:57:21 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id C0DDD2415B; Fri,  8 Sep 2023 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1694159830;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=h0oPHC3ncWv5YfWkbB43HAFPln0n50nMW85K0H+fae3M+aCp10B6GceiOcK/UD0/E
	 T3pkXG0xaw+Jayw0mhaYWEAl2v1JkSM7f+x0gp8Yglz4J/wJDGpVvSha/G2by6MRN4
	 mtBPUR76qPR3bUzD6z/p4YxGqgzl2LgvRvzxI3Naf+Ndvt0cLQJhOzKcG+5/U4l+jc
	 y6qNZc6fgNGO+r+iPyQ+pUM88CT4CwUz+HbdIln0ZebxdegLYLJFVNCoMC7tLWbDlB
	 OfR7D2S8t/WzQOBJNFRVGhYdpf+7l5Z/5g0YyMwkXiaKsGlpHbaPIubntW3Aej8FHu
	 jmKTBzU7iB1OQ==
Received: by mail.commercesolutions.pl for <ath11k@lists.infradead.org>; Fri,  8 Sep 2023 07:55:55 GMT
Message-ID: <20230908064500-0.1.8j.1lkd3.0.kvarvqg8r6@commercesolutions.pl>
Date: Fri,  8 Sep 2023 07:55:55 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_005719_045980_56E6BAEB 
X-CRM114-Status: UNSURE (   1.01  )
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
