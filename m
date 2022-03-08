Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F4BC433F5
	for <ath11k@archiver.kernel.org>; Tue,  8 Mar 2022 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SfFKfIukl2BVoelNnnnq+UK2nVOWWfsHg9tbI2vIH0Y=; b=miJTYu4fxcGomU
	q3GnYT24NDxSy7LzH2XnbM8YXS/82pIj22q/xwAZJxT7+Y5/E7FjgiKEi8v8PCBG7r0HgfoCEr1hQ
	hUd2PZsUL1yAxn/hrqbATV7BW2/jWQTbTq64QoRGA021r8RBxOcD8s2M17Xexl1zVEIMokEa2BAGb
	5oXh6plflBOXWhqmUEgGqJ0M7wGOKp1+7JGNPsVwclJ5IQK3G1WkR7dtR3xoEz4XYd+Ip4EyLWeHk
	JKLeWqbqUo0pa0Vk2TWzbNF/sWza3gxQdk38+MWpIIqFqwKq9uzhZDKlFQ/ZJ7QRyZ4H7hqSrnMTj
	HOzpSPj+rx5WwHDd8mgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRU7R-0031qI-9F; Tue, 08 Mar 2022 07:18:53 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRU7P-0031pB-3m
 for ath11k@lists.infradead.org; Tue, 08 Mar 2022 07:18:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id hw13so36977825ejc.9
 for <ath11k@lists.infradead.org>; Mon, 07 Mar 2022 23:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VErC7r/VIhgtIP6NXdpGci8BSiNBhU0SX2iLoyScINk=;
 b=UKq/CMmizDKXVLYIBOg1sWN/vdxd+lNt9BCksrJ6lhd99YZMNEzWssT30OY8G41Z9d
 TEl+b/Oue1O2zgnSh3WbLjc5wyHsYmvcLdrZzL90buknv/MfS/tU0ZfbI8KZLeQq1ym+
 LBxzdsDEaPlvbWLPxED5f1XSzF7z0tVW0NA2SnXPYqYXkbvH+GQdLMnXnD6EZ4pne1nM
 ZKrhfgfj8odm8ue9yo49ENe3XpEjx9cjK8ajyTKzNTsi8lWTJvBeMb2RI6WeLrOzspCX
 gYdm/tmc6S6DoQN7E3bw0g9WGBce6TVAE706YGWEn6OMR/LP91C0JFYF9EWeOb7Shg67
 lmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VErC7r/VIhgtIP6NXdpGci8BSiNBhU0SX2iLoyScINk=;
 b=D8BPpHKeuwXe75hHwDfY0Sq+0Po+J19nGL/Kf8XkE0OSPIcDcTTTWGCHTOfqc+SxUz
 i7/SsGClIGZGRF/XmhnE6Rf7MSpyAkAGpZpfJZ359Qm/qbmTPMhUskBf19Usvd6Q3Inz
 6KGZrz8oesOA81+CtcpFSxNPwwmixEQRrRhq8gl5CkAMHIzXG+WaGeTCdfkvYiW+qi6k
 D2qGNumoySdEOAA/mHCwncEAX5Oe7rJPlM5dquj0xRE3OhsleygM7d1t+WQhOO3wSiTx
 Zhz+Up++L07mf4XZJ+DMhxadTluLxjcgpGngXo3O0snj9z3P0hzxY8wdZJNea9Mx/8LD
 Qtww==
X-Gm-Message-State: AOAM532IDdUjRsjB6wR2kEldvdN6+ybtCl62Nk6de/IKJa9VSaozZ8d2
 eoOsel5gyg4l6iJ73n1EyJo=
X-Google-Smtp-Source: ABdhPJx92VMHnkznyhGHK41B+WRt9fmIrnkEFUivR46lfNOwYjAVmLv5Ee3fSQR9lFCpAwi8hZ5mSw==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr11625922ejn.278.1646723927789; 
 Mon, 07 Mar 2022 23:18:47 -0800 (PST)
Received: from felia.fritz.box
 (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de.
 [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a170906338400b006d5aca9fc80sm5452981eja.106.2022.03.07.23.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:18:47 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry for QUALCOMM ATHEROS ATH11K
 WIRELESS DRIVER
Date: Tue,  8 Mar 2022 08:18:27 +0100
Message-Id: <20220308071827.9453-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_231851_210965_344D2D87 
X-CRM114-Status: GOOD (  11.06  )
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

Q29tbWl0IGRhZTA5NzhkNDE3NCAoImR0OiBiaW5kaW5nczogbmV0OiBhZGQgcWNvbSxhdGgxMWsu
eWFtbCIpIG9idmlvdXNseQphZGRzIHFjb20sYXRoMTFrLnlhbWwsIGJ1dCB0aGUgZmlsZSBlbnRy
eSBpbiBNQUlOVEFJTkVSUywgYWRkZWQgd2l0aApjb21taXQgZmNkYTFjYjgxNjYzICgiTUFJTlRB
SU5FUlM6IGFkZCBEVCBiaW5kaW5ncyBmaWxlcyBmb3IgYXRoMTBrIGFuZAphdGgxMWsiKSB0aGVu
IHJlZmVycyB0byBxY29tLGF0aDExay50eHQuCgpIZW5jZSwgLi9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsIC0tc2VsZi10ZXN0PXBhdHRlcm5zIGNvbXBsYWlucyBhYm91dCBhCmJyb2tlbiByZWZl
cmVuY2UuCgpSZXBhaXIgdGhpcyBmaWxlIHJlZmVyZW5jZSBpbiBRVUFMQ09NTSBBVEhFUk9TIEFU
SDExSyBXSVJFTEVTUyBEUklWRVIsIGFuZApwdXQgaXQgaW4gYWxwaGFiZXRpYyBvcmRlciB3aGls
ZSBhdCBpdC4KCkZpeGVzOiBmY2RhMWNiODE2NjMgKCJNQUlOVEFJTkVSUzogYWRkIERUIGJpbmRp
bmdzIGZpbGVzIGZvciBhdGgxMGsgYW5kIGF0aDExayIpClNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1
bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgotLS0KS2FsbGUsIHBsZWFzZSBwaWNrIHRo
aXMgbWlub3Igbm9uLXVyZ2VudCBjbGVhbi11cCBwYXRjaC4KCgogTUFJTlRBSU5FUlMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDJiOTZhMjJjZjVlYS4uMWU1Njcy
MzYxNDZmIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTU5
MjMsOCArMTU5MjMsOCBAQCBNOglLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgogTDoJYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKIFM6CVN1cHBvcnRlZAogVDoJZ2l0IGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9hdGguZ2l0CitGOglEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFrLnlh
bWwKIEY6CWRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvCi1GOglEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFrLnR4dAogCiBRVUFM
Q09NTSBBVEhFUk9TIEFUSDlLIFdJUkVMRVNTIERSSVZFUgogTToJVG9rZSBIw7hpbGFuZC1Kw7hy
Z2Vuc2VuIDx0b2tlQHRva2UuZGs+Ci0tIAoyLjE3LjEKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
