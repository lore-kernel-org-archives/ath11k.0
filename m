Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9A5C77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QpLJ76+dTaELqZNwYQMeQ83XgK3XIRAls5dpkjaLZIQ=; b=X/jk/Nacp6/q4t
	He4jerZ4mSidyq/VOjXK9gWbpVPus0E3ZRLKB0iXjDCvuIo8PkpZ6CeLgmKqjpRDPWc5GzkfPmYKH
	Or4G48yrvGOblLv6tgEhFnByfAEEnIMznKkr1Y4E1+nOcGjWC+iwiYqwuvo3ThLLMYsOZi+7syGgw
	xuAFfLq9PlR2/3U1+FOZtGUK4597kG/i/71I4hQxkbka3XBenmbPDh+xqlByaOAkjCuOJdhyW3uAL
	7jTSsNnO39zkFvXqp82VCo42r36BxLAJ5Z/80Cfv/9Y00aEOPenmkfPCZWO/hI4sGINcPfa69bqhM
	BR//27sQz3+YmOQHombg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohVs-001RQa-02;
	Tue, 18 Apr 2023 09:20:36 +0000
Received: from mail.feshiecree.pl ([89.40.114.103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohVn-001RMy-1c
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:20:34 +0000
Received: by mail.feshiecree.pl (Postfix, from userid 1001)
	id 2AEB986515; Tue, 18 Apr 2023 10:14:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=feshiecree.pl;
	s=mail; t=1681809286;
	bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
	h=Date:From:To:Subject:From;
	b=DeUUCHhrBm95nmRxOsIm5m1pp9PjRYJfEP78Xy4IRlCWTj38n7Ncgs+DFlho9+F6p
	 GMqNkq/CjTvz4Ii4Z7SJUec21eojL3BHQzt0pxNFXMHNPkVtQ3CWHhzcmDw/2fyosE
	 TskUTDzojX8wv1qoj6mJO29aP3oT2tWFLT/XUs/nJq0tjgB9anWPVS0GUxgId+zpwx
	 3hkaInrW6Or49LnNrdQLe5NS75ryWmI0OwnzJTby8s/1RzuPd2Br821cSKYeLpw6MD
	 GZUgfU8PxH3jVIwq1ja8wjHtanhbzv+suYML3rkGu+WPMzaxiKHLVDdCou93RnkZHn
	 o5355CUjeEYvg==
Received: by mail.feshiecree.pl for <ath11k@lists.infradead.org>; Tue, 18 Apr 2023 09:13:54 GMT
Message-ID: <20230418092844-0.1.23.c32f.0.2f36rorljj@feshiecree.pl>
Date: Tue, 18 Apr 2023 09:13:54 GMT
From: "Krystian Wieczorek" <krystian.wieczorek@feshiecree.pl>
To: <ath11k@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.feshiecree.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_022032_288230_4D07A607 
X-CRM114-Status: UNSURE (   1.14  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpLcnlzdGlhbiBXaWVjem9yZWsKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
