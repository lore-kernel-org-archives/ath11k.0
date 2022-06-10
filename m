Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1553CC433EF
	for <ath11k@archiver.kernel.org>; Fri, 10 Jun 2022 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VQTk4rNsvhBf1Qg8Qms/jt/k2PVCWCwAuX4w5Mfbsg=; b=h3kGqqIpoV+VXA
	Zes++89LckXQl3j/XHHkHxOI4+nzIJ+WkjylTn4XbVpqsh1KJrN9j8iz3PQtHB7hZoTXRsmAQzXMp
	DizwtmAA9gaINIH289jvEqG4xPJuAGklYHLAJj8nOdhpqItM2xjJevilFV7AscEcdrH3JaRetdw/J
	bupSlng3+ijhWs0BwqR6np/vfSefQJsnSw/5Xuho9r8UOdutYpk00HPKZsu0b9vCsFvt+603G+lX9
	MyjGVD59wTMRgMN65K46y2/62XUK1nPYjDuOGpTSlCH8juifLpX9CO9jhA8aS+T5I+uo1glnRdQmJ
	2tFifosQgVD19sP3ceuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzf1b-008R6P-Ds; Fri, 10 Jun 2022 13:50:07 +0000
Received: from mail.toke.dk ([2a0c:4d80:42:2001::664])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzf1X-008R0U-LU
	for ath11k@lists.infradead.org; Fri, 10 Jun 2022 13:50:05 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1654868994; bh=zil8mYWDXNWzrYFcgjo20HtZ28WaJISVny9knb0R/xY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=x/NYYhjLFn1PnQjbonVKObab742pbEl97CbrQFV+oNhkYWmHDfvmB30RqsfU8XKu3
	 k4YB5dwCHBUv0M24zOWnwGyLZ9490j3Zoyr7SPVUEldIFRZpvuNkLsue7ejjgzP1XB
	 nWZyrpi6vZMHgSa3vILbAtTJgkfqKRLQETwws/DrR2lAGk6z9IWnzeuo5+fNiagP+q
	 Z9pMSYUGW4ysQQo/GrwXc7CWXPmZuLZwSLc9Yptw/SzefkisxvEOI72ONP/idqWLTv
	 nV8g+w0D9mpKhNmsu2SowgaG7HhGLNYa5vAb7ddZdi+stUZXDh7qwwZiWLXjnmCzWA
	 P0cFtXNwES9cw==
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless v2 1/2] dt-bindings: net: wireless: ath9k:
 Change Toke as maintainer
In-Reply-To: <20220610133640.10810-1-kvalo@kernel.org>
References: <20220610133640.10810-1-kvalo@kernel.org>
Date: Fri, 10 Jun 2022 15:49:54 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87edzw4ohp.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_065004_464333_5FEA62B6 
X-CRM114-Status: UNSURE (   2.57  )
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

S2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBLYWxsZSBWYWxv
IDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgo+Cj4gVG9rZSBub3cgbWFpbnRhaW5zIGF0aDlrIHNv
IHVwZGF0ZSBEVCBiaW5kaW5ncyBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFs
byA8cXVpY19rdmFsb0BxdWljaW5jLmNvbT4KCkFja2VkLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJn
ZW5zZW4gPHRva2VAdG9rZS5kaz4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
