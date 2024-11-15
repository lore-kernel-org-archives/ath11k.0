Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DEDD6DDE0
	for <ath11k@archiver.kernel.org>; Fri, 15 Nov 2024 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=54+25EjLq0hNb3xuFLRlZur8gY9OKjhNExloSKR8JN8=; b=eoMvam1hZmdp8gGKp978ln5xUd
	rYlv3c2rFQIwdUBxi6bAiDgzlILTHZUKVVNk7hmvtpLZJ+dEY5JpQ7cC3tL62W4KMPt96k5sU3Pm6
	eCkd8GpEhb2ipBcB/LwWpCD3pkDco+EtgCX5AeenJ1JWqeXZA6mQ9JR3aa3ckuIMdtXsPYzZKfxHB
	e1F3XM4Ev1Etsh9lAL5dLsGmfz4UXUkoCNwRdrN+rdLcs2cEfgPFO0iqVfgdKecAm6HUpiYIcvsKH
	pDanWgD+Eg0Y6QkZvWygwR0vfeWRxJLsUPW2m0AIAYy++hgQe16qgCekxhxe+SiIdB2sGEwwjfMGV
	R4KK7+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqrq-00000001wBj-3sUw;
	Fri, 15 Nov 2024 07:35:46 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqrn-00000001wB4-2Uy5
	for ath11k@lists.infradead.org;
	Fri, 15 Nov 2024 07:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731656139; x=1732260939; i=jwollrath@web.de;
	bh=54+25EjLq0hNb3xuFLRlZur8gY9OKjhNExloSKR8JN8=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k0fMcZGeFjXCNViTvk0xUDALXebNGaFu/5G8j/05jxQfHA9kw+fGMSC6k1sO9t+n
	 9ImCv+HAePKYChDc8s8FB5/SqCk24GGXUHWb9W68N0YlBNq7H0Kqq++qM1K+DbT+c
	 8mOYNgi3oEp8BR75Kf7Ge8OFuo4HX/OY2HgDCgfv/bW4XpinkO8ruqplGH++G7JRf
	 ik49bilFLGndIcMQW9aYkob8jUEwiF5g4w+HqJGNTdkdXbAUJ/atEIDz7E+NfjaFl
	 GVGtLeGhGiLZDShFKRphzDV7lD7JWV3bzwzVE6YcucgYF75Pyyao9zqINhz9SXK1Q
	 Ab2/xqduzrKdym7JCQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from mayene ([194.12.155.5]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGxMN-1syKLo2DGl-00CGLV for
 <ath11k@lists.infradead.org>; Fri, 15 Nov 2024 08:35:39 +0100
Date: Fri, 15 Nov 2024 08:35:37 +0100
From: Julian Wollrath <jwollrath@web.de>
To: ath11k@lists.infradead.org
Subject: ath11k hibernation broken since v6.11
Message-ID: <20241115083537.6a5681ad@mayene>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pwyqY3e1MhscOhAPtxpOu0sY4CrEDca80mRkLI0uTcwj8mE8yR1
 HgbKSZfFEPhekrbvn6X+r52tVE8xaAPU/2l+sbEl8WASKM+g/wnzN/R/Wt7bFtKK7baVQxc
 oIOTGcO6vvESiOUa5qzqpB+4dEjUDBNYlFyU2F7dmYeO3BQ6uTANOdMfaywsIwCNbL7nSv/
 LhVnaop9kLpi2h0tWK4uw==
UI-OutboundReport: notjunk:1;M01:P0:xzJGK+1nOXc=;WhWSyv2puPw1QdjeHqcI3LLnkik
 PR3UDwXyPxLzngnOs63DG1hMAeinlnHWVX/Clq3Va+iQYVgpMyh9d4Bv+dOEy+ujYD6UQwXPN
 D5viYcTMpQBMC6+zbE0OAKu8Ydnh05hZZ/IrlnUByrB67R8QaMXswDNFrgLKjhlwZBWl8YEIz
 UotoI0S9dXnxeOC64xIww0a83EKa4IAIxhn7h9sm4A32SGhR9oPvm4JAEehwQaXjiFkJuO6ks
 OzaaL47/RtRBEu0jP5AAQODBSz70ZFEqW1Xy3LPA+7DGgJiYEdTN4ndRp4FW2/1rZhHvs1Scg
 w+wdvmMWnixxxfZyfgrYBSePzm4nlI83UCNiDToec8U7Lu5j3Fu/ZtTls+KSaGNBVFbbBM/OD
 UwwisqH1Gxo41isjrFNbrNcD4HL4en4+JEVThnFU+xYbwJtKG2Kce96xs1AuwjxbAKlBvlkV/
 o8E+IY5y4L/utlKjrjedCcVi7eo0/kB7JnYJcCS0NAmEA25QL57tjfdrS5Ltkv4Fdu/l6yhVo
 w50FMFroEI5eVyxcxLwKHomFSqXZU3s/WnuBzRdeJGKophxBLp1Pcd9sLcCb88M917uWCqRBd
 jFLf1BkTYHzVzhSDNQDKVXWszYC7fVV1UWXYARAZh1UhjV+VnRiU5FJ4K60wmI8wsgekYt9Cu
 D9ohiZqFOhONx47wN3rHq0nnW7oBRwwC8/Gv5Eh3U9mMphrTp+y48rbTuRKQ0rWDCPgL2TGoG
 qxbHqaPD4a17gFyf3IxJBmLIXeMA+e9SVg9ucBWVHonj0/s6DgADHWwerxJLHk7JCBmjk1YfK
 0WkBRfYK9Bq/46TqtlE2LQKMZHdAJHyX2a5usChiBhchD6oGgAYuCJEa28+w/Ua3VStFZbQNj
 I5Mygi4S/TZoAwhm/KDt3yM7oIL7OifgW914=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_233543_994415_37ACD5F2 
X-CRM114-Status: UNSURE (   3.19  )
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

Dear maintainers,

it seems for v6.11 the patch making hibernation possible with ath11k
was reverted again (in commit 2f833e8948). This broke hibernation for
me. Is there a plan to re-introduce it? With reverting the revert on
top of v6.12-rc7 hibernation works fine for me with a

$ lspci -nn
02:00.0 Network controller [0280]: Qualcomm Technologies, Inc QCNFA765
Wireless Network Adapter [17cb:1103] (rev 01)

in a Thinkpad T14 G4.


Best regards,
Julian Wollrath

=2D-
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

