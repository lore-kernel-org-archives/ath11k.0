Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2E8D12667
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frFgCrWmSijQIbE0s2cLug5C/eMtSEJl8xqwEfAC0eU=; b=XbxzxpRIBi28Ud2b3Qv8BBVw7q
	fILZL9FvkH7kVwykcUltLdystyaK87r5pgUdObLUMS9pM+soEtjTYwu1sYWVFWUADmMtWWjznfq1K
	hyfDBB1piFZ4i57ZHLQoPNCpsNC1kHTQtVipu/a22hxCxqK92IrL7+JkAHHidJEM9uDcYhfEF/5S/
	G49BQ4tna8P86u1gjr7iprndUChhgL25ispLDLuuQOC8sFHVQxv5iqiQnsu4AVeQpfHAgKptpA+uw
	+o5no7kZ/ZyvpzBh7JeW0CLvsK18HsjeJhpfBMAzy0EeYkQCsKkHsjm/r9mu6i4jjFB+y4LLpjQ3B
	3kSf48sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EjZ-0000000GIyN-0Ei9;
	Tue, 05 Nov 2024 08:16:17 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfE-0000000G9Ty-1tS0
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=mwFNh6fCQilCetdqM9GB1/3XnP01zdiqQkD768arI/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2AJ3nwOZKg10BVgVoOn8ifF56LhGnnrXSMwaRwhndGRTABhjJNoEoKWAzDFKoO+f
	 n9NFd46RTsJgiE3DuM0sFU4xj6jdKvm+54RTSwYt0biGbpSJSNdgsRo75LaDjPGOr+
	 L82nf9FTZfItu83k3OOEEOhwTR7ifkXGjRKyHRHU=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id E8E9C14886E1;
	Tue, 05 Nov 2024 08:07:42 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 03/11] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
Date: Tue,  5 Nov 2024 08:06:17 +0100
Message-ID: <ca566b6f38bab295ec06654bc60e035ada9c1987.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230744_684183_0A587C03 
X-CRM114-Status: UNSURE (   8.36  )
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

Adding this allows us to easily supply an endpoint ID to bind on later
on when creating the socket.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 include/linux/soc/qcom/qmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 469e02d2aa0d..77743c855762 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -212,6 +212,7 @@ struct qmi_msg_handler {
  * @txns:	outstanding transactions
  * @txn_lock:	lock for modifications of @txns
  * @handlers:	list of handlers for incoming messages
+ * @endpoint_id: QRTR endpoint ID to bind on
  */
 struct qmi_handle {
 	struct socket *sock;
@@ -235,6 +236,8 @@ struct qmi_handle {
 	struct mutex txn_lock;
 
 	const struct qmi_msg_handler *handlers;
+
+	u32 endpoint_id;
 };
 
 int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
-- 
2.45.2


