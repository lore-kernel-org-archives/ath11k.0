Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C57EB64D7
	for <ath11k@archiver.kernel.org>; Wed, 28 Jun 2023 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nh6vlVRC+9prKysRb6MEWxCtsoyhfO2GYfXyewWRmuc=; b=JXdJ6cy+PXsIO5
	+TsQ9jh4kEZbDUt4nl2e0T0Q+XNe7bZa0ggJexmBSveDVKgS4zTNINDTuUqZM7xGflQl9phWGvN37
	ieWd2icnpD/q3TmCEuzz8CLPkltPQWrszoH/l6aaciB/HcjexOaPKB1P5cY1x55gtT/DnW4W7jZLl
	VIhFthQvtBsgo/4nhc5ivMTlMFsIBHvUcqRZ+RqOVOP5ryQtK04aMrsvnsNQaFE7dsKQDJX1a61TT
	jqJiVBof/wfzbT7xaOc60yf3WutS3t/HUGMCPB/+u7lkQRz7O6lDNt+rYKrX8e4YydYDknCpXjxca
	kMIpReeaRpVHqgcYk8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERCj-00FDgI-0T;
	Wed, 28 Jun 2023 09:11:13 +0000
Received: from mail.shaniko.pl ([217.61.105.186])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERCd-00FDfu-1J
	for ath11k@lists.infradead.org;
	Wed, 28 Jun 2023 09:11:11 +0000
Received: by mail.shaniko.pl (Postfix, from userid 1001)
	id 6719782B66; Wed, 28 Jun 2023 10:10:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaniko.pl; s=mail;
	t=1687943460; bh=Y2yJ+RomELl4kjdwTjOCFteq1VzoJmA+J1hDVnltrr4=;
	h=Date:From:To:Subject:From;
	b=A8KDXD72DgrMPeMPKFj8JslJXfiI4ZJ39bgF6SfJn013Iley7Miqk4+2Q6dlMcE3r
	 GMihSPC6Uy6ZtM74ohGq9zefKKRqpL7YJHQUQWKRVwl2UwDHoN+C5lNsduwLIgdyPF
	 O/+Cal2OGL6dsabtqhLdxyoGGhVa1RtE8sDOuYqfK6SuRzVf37ni4s7vpDzJUIed2H
	 XrmZ2HbuKE2b59AkB41X7LI8nxujjSXkM/R3viE9pYGSmca1q/dfvPHJ+sBHr4gX8C
	 Y/RBkoCNPo+vYCUxWlJHGH0S21whxZj+/qwycTX9nV/rMYWbfXp4nlU+vIGNDlW37X
	 aXfRJfqHK9ABw==
Received: by mail.shaniko.pl for <ath11k@lists.infradead.org>; Wed, 28 Jun 2023 09:10:45 GMT
Message-ID: <20230628093432-0.1.6q.9dpb.0.52vvktfdyh@shaniko.pl>
Date: Wed, 28 Jun 2023 09:10:45 GMT
From: =?UTF-8?Q?"Micha=C5=82_Tetmajer"?= <michal.tetmajer@shaniko.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Hydroizolacyjne_pow=C5=82oki_dachowe?=
X-Mailer: mail.shaniko.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_021107_690903_5A80CE07 
X-CRM114-Status: UNSURE (   1.65  )
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

RHppZcWEIGRvYnJ5LAoKcG90cnplYnVqxIUgUGHFhHN0d28ga29uc2Vyd2FjamkgZGFjaHUsIHBv
cHJhd3kgZXN0ZXR5a2ksIHNjaMWCb2R6ZW5pYSBwb2RkYXN6YSBjenkgdXN6Y3plbG5pZW5pYSBt
aWVqc2Nvd2Vnbz8KCld5a29udWplbXkgaHlkcm9pem9sYWN5am5lIHBvd8WCb2tvd2UgcG9rcnlj
aWEgZGFjaG93ZSwga3TDs3JlIHNrdXRlY3puaWUgcm96d2nEhXp1asSFIHByb2JsZW15IHogbmll
c3pjemVsbnltIGRhY2hlbSwgamVnbyBuYWdyemV3YW5pZW0gc2nEmSwgYnJha2llbSBsdWIgemJ5
dCBtYcWCeW1pIHNwYWRrYW1pLCB1c3pjemVsbmllbmllbSB0cnVkbm8gZG9zdMSZcG55Y2ggbWll
anNjIG5hIGRhY2h1IG9yYXogbmFwcmF3YW1pIHBvIHVzemtvZHplbmlhY2ggbWVjaGFuaWN6bnlj
aC4KClN5c3RlbXkgbmllIHd5bWFnYWrEhSBtb2Nvd2FuaWEgbWVjaGFuaWN6bmVnbywgbmllIG9i
Y2nEhcW8YWrEhSBkYWNodSwgYSBzaWF0a2EgemJyb2rEhWNhIGd3YXJhbnR1amUgUGHFhHN0d3Ug
dHJ3YcWCb8WbxIcgaSBuYWpsZXBzemUgcGFyYW1ldHJ5IG1lY2hhbmljem5lLgoKUG9zaWFkYW15
IHdpZWxvbGV0bmllIGRvxZt3aWFkY3plbmllIHByb2R1a2N5am5lLCBsYWJvcmF0b3J5am5lIGkg
YXV0b3J5em93YW5lIHd5a29uYXdzdHdvLiBEb2t1bWVudGFjamEgamFrb8WbY2lvd2EgcG90d2ll
cmR6YSBtb8W8bGl3b8WbxIcgc3Rvc293YW5pYSBwb3fFgm9rIG5hIHLDs8W8bnljaCBwb2TFgm/F
vGFjaC4KCkplxZtsaSBzxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmkgdGVtYXRlbSwgcHJvc3rE
mSBvIGluZm9ybWFjasSZLgoKClBvemRyYXdpYW0KTWljaGHFgiBUZXRtYWplcgoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
