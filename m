Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205DCA5FAE
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0SpTiW24gqodrG6drX+inFH+5+/ODz6dnVzpES9HOY=; b=FOxFTzGo0BAS7apRxveglydRpo
	hkX2y3wRaORg19dHJOZ7pqVa3W+ldlabcd8lF6BHJ8oqCkD+Ey4eOrMtOKBklKudsWHa2R8zQrdtc
	Ovv9CIVoIG7ElxsU4QtYq/JCzrs51ImVbIjwejpDOk0OwkOPV/48yMgqIfLtXlKBIJM+EdUQ2fmFN
	d+RgBJrPyHgAlpIdTIu52wEWrsytRgmhLoPLmTI2iXPECS/dB4CuO4rGuSTQK6xex6Pq9NdpH9OhM
	DUG7vM4bTjndWYAaaBYSatljMuC5d5fdnntxOHzqYTy/MYeljIWbdkTRXulw6UxU5iRq/36kjwZWQ
	4XNEk9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZXS-00000003uU6-0BNE;
	Tue, 29 Sep 2026 15:14:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZXO-00000003uTU-2nOF;
	Tue, 29 Sep 2026 15:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=z0SpTiW24gqodrG6drX+inFH+5+/ODz6dnVzpES9HOY=;
	t=1790694874; x=1791904474; b=vukMvFbJocgNiJtrFHqWZTwZFwZlLjlBXNGdV17fteWVaPa
	vvG8YFGFH8j5YZqmCCqHf2oPj7UpZm5sHHSuarI7kWSof8tn4rj5VW9L1KU2TjPYkcb/S5vYO4mfL
	CAdiHXBaC+zbN4JBPrzbUOJ0CjTo4kAVnOwqBf9vNJ631vl+eiY9MNKXZykx7bdeHwIa+wdxnlHhs
	SQ7XV+nWGv63U+vokbAlvLxOHk7SHuzbBoAOw+V1GaKF/vJkF7MXpNxrzSzTA49v+defu83N06GOK
	5skW8j2/2jMORuwHmCLgk3pbEdexdeAvJnCGRUq7TRnTJ8ehu9pGei/HnoZ8y/jw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xBZXH-0000000F75L-3PQv;
	Tue, 29 Sep 2026 17:14:27 +0200
Message-ID: <126186f5f19d13dcb9ff0618faed010adf1afee4.camel@sipsolutions.net>
Subject: Re: pull-request: ath-current-20260929
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Tue, 29 Sep 2026 17:14:27 +0200
In-Reply-To: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
References: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081435_007801_C0DE1598 
X-CRM114-Status: UNSURE (   6.18  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 2026-09-29 at 07:58 -0700, Jeff Johnson wrote:
>=20
> Baochen Qiang (1):
>       wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resu=
me
>=20
Hmm, it's complaining that the fixes doesn't exist, and that does seem
to be in wireless-next only? The patch/PR applies anyway, but does it
then cause a problem if the fix lands before the bug?

johannes

