Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460BAC7EE2C
	for <ath11k@archiver.kernel.org>; Fri, 25 Aug 2023 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nh6vlVRC+9prKysRb6MEWxCtsoyhfO2GYfXyewWRmuc=; b=jsh+gD3JQGbo2K
	PhWn2EGndK+31p4oYvg3fVMnJJQkZjzEpsywmLgRICkXGPCNfkNwwH1MG+n0fNr/NeUDU4zRfqkfa
	RAxyPsF9+L2FW7DZsAqNKMZwtL8ocCbiw2cJzWv3JKJNjYE73i0imgP2qq2jnrW3ZjmAcm92fm9Ka
	NC2lQiv/LS25SHwwICfB/2oiWS2u9knn5HC3LpqzhhIvDwEtQPeLpU2e3txpYKIW3NRE5KLbOV1tN
	55CNl9l70sOBfMbBQ14orF2YLbrJj2OYkQaQ4bxLYxKWalE7+iHjzerzsxzv7Xc0V7sOiyfd1yto7
	PWGUbcogGVHpo3NcH5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRWH-004ZDh-0q;
	Fri, 25 Aug 2023 07:46:13 +0000
Received: from mail.tarvie.pl ([217.61.105.186])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRWB-004ZCf-33
	for ath11k@lists.infradead.org;
	Fri, 25 Aug 2023 07:46:11 +0000
Received: by mail.tarvie.pl (Postfix, from userid 1001)
	id BAF6A83087; Fri, 25 Aug 2023 08:45:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tarvie.pl; s=mail;
	t=1692949560; bh=Y2yJ+RomELl4kjdwTjOCFteq1VzoJmA+J1hDVnltrr4=;
	h=Date:From:To:Subject:From;
	b=ge6hJqKUhwMv9rRSEYJDVazfBPZDuhobqTYJSk2n/3/s8hO8mQiCircQu0mv/NBjw
	 fPeIo9M4RQVmxs6gMlXFKwUnKQYf8VehQVIEwxLu4vjKfEAiqYWpT01lAp0wB5JcvK
	 NfGXZxb5VIxbTXe83Wr6b231EGSAq2yo8VkhQo7DEwPyync7uGZtChpxe9gtxBNbQb
	 aXH4sF4DX4aABV7JYqSCPPoKtuK/PqsaMqQHrq/uRUn7Yz6RUlIkzmol+NZA6kqqkp
	 BJzn3XtjcPeI0grLdCKpfs/EZeyX+hTCVTRgVezvVYnUrVtoyydJ/+1qBVDJqjoQf5
	 YXW8XSDKIYyzA==
Received: by mail.tarvie.pl for <ath11k@lists.infradead.org>; Fri, 25 Aug 2023 07:45:52 GMT
Message-ID: <20230825074500-0.1.7v.9dpb.0.dresnis9tc@tarvie.pl>
Date: Fri, 25 Aug 2023 07:45:52 GMT
From: =?UTF-8?Q?"Micha=C5=82_Tetmajer"?= <michal.tetmajer@tarvie.pl>
To: <ath11k@lists.infradead.org>
Subject: Uszczelnienie dachu
X-Mailer: mail.tarvie.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_004608_708944_10B334AF 
X-CRM114-Status: UNSURE (   1.45  )
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
