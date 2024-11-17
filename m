Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53695D6DDFE
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frFgCrWmSijQIbE0s2cLug5C/eMtSEJl8xqwEfAC0eU=; b=ZiAD2T8g9b61wgqSYoDZzNmxp+
	o5PtSYxlE+u86tPcOQbEzsT8L6KbcS0u7rc+IoZulRQ0GjxMHPMALdZhMeo00E0z0BoBdOSvwgnNJ
	3Cic5XZ9d5goP7w9j5lK92uaDV2J1+/DQZHrHo+hvo6hCR0QzRWC38AuFskZBuJIVujJLbU5qb8ac
	pu4lwMc9Ksk3racW6Xl7WsBBDlIVvpeOV9q0EdZKvHYLCX5rZDM1DZUOlRUj0SodMTMNS+BAXku2+
	Jxyf2F7B2k/E6sqnjGCre4ALbhREedATPY0aUzafm9teZ/PQpyz50A6TXaLnDpKtB99/RvOiyDXyx
	fPjm+V0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho8-00000007XUh-01Xg;
	Sun, 17 Nov 2024 16:07:28 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCho3-00000007XP8-0u13
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731859634; bh=mwFNh6fCQilCetdqM9GB1/3XnP01zdiqQkD768arI/8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NduhVmFLGFJf6xbAzJERlcY2wDe+IhBjDwJscLZfqOMS58TsUlrkiEn4TQsCbazxo
	 hYpDx6evdWzgEI4MAjQM26zNrEWbUx88h/J/RfmiGrOnVC3M0/sNH9WK9r8ovJFCI6
	 fvC42DWpDcPOXG/Q32/M3RNRoYa4Sma0kHNXdKXU=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id DBD5C14886F2
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:07:14 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Subject: [RFC] [PATCH 05/13] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
Date: Sun, 17 Nov 2024 17:06:04 +0100
Message-ID: <46d51d7bbaf45169aaf2c8b364bd5d7540e42de2.1731858974.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
References: <cover.1731858971.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_080723_432631_F0576E11 
X-CRM114-Status: UNSURE (   7.77  )
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


