Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D7BC433F5
	for <ath11k@archiver.kernel.org>; Thu, 26 May 2022 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BmgNxTtX2BpeFR86W3BV3yitaozcR5YE0/UDAFzMjNY=; b=zpJYX0TmI1Mq3g
	2ozrd40oKq2Uf16AZLj8yiOzFR9252ZpRFlY3luXPXvEJjRSf5ev1CXk6HXzGmqTRSp3wM5A4EpmW
	9FRt0iMuNHeHtOcbkv1RsHwCTn7nx0CLvx2hW9H2VFXksNjdpSE4ITbCOkrnAHqliRk0PuqwSfH1N
	u03GZfWM2ottPM0RLqcbE4mppnQerD3+2WTG0NvFER6DhsiFjnPl0eWlIyGlqkHxXrIBeEm0BBqEE
	OFcL1kp3godwx7EIXrvhzDEVtrHeg2iAHEVpfjD1KeP9IOBcEuw3mChBuzKYm1lBblZTu9yXfm9Xn
	LaFAzktWthw0pYo44tow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAKg-00EJbz-La; Thu, 26 May 2022 10:03:06 +0000
Received: from mail-m973.mail.163.com ([123.126.97.3])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAKd-00EJb6-JN
	for ath11k@lists.infradead.org; Thu, 26 May 2022 10:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=SIdeg
	1ju9DDQN5SyCoUMa81G3s2La6ZRZRDFK36w+Gs=; b=IT45QKTSbSotUcsxZObUz
	X/x0mnRaCmfMUDbvpTmu30DDcXk+RYMzFjgtF4l8haYS0UnziqbLhXroCc6DIIAG
	BcooIfejMSHpSQ2E6pdNkjqKvJcZg7PehLp5WqqZBSX1/hgHSZKGolkFQ0wPuV8R
	ukHMk7ZJ+pr7Is3O3/cr10=
Received: from localhost.localdomain (unknown [123.112.69.106])
	by smtp3 (Coremail) with SMTP id G9xpCgAXuJk2UI9iK0jaEg--.27316S4;
	Thu, 26 May 2022 18:02:43 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianglei Nie <niejianglei2021@163.com>
Subject: [PATCH] ath11k: mhi: fix potential memory leak in ath11k_mhi_register()
Date: Thu, 26 May 2022 18:02:27 +0800
Message-Id: <20220526100227.483609-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: G9xpCgAXuJk2UI9iK0jaEg--.27316S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr48KryDZrWkKrW8uw1rZwb_yoWkZrg_CF
	ZYgF17ZrW2kw1rJrWjkr4UZFyS9ay7X3Z5Wa10qFyxJa95Z3yDuryDZFy5JasrKr4jvr13
	CrnrAFyjy3sI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREF4i5UUUUU==
X-Originating-IP: [123.112.69.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbiPhcNjFxBsWDfhwABs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_030304_011834_71335DF0 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
errors occur, mhi_ctrl should be freed by mhi_free_controller(). But
when ath11k_mhi_read_addr_from_dt() fails, the function returns without
calling mhi_free_controller(), which will lead to a memory leak.

We can fix it by calling mhi_free_controller() when
ath11k_mhi_read_addr_from_dt() fails.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index fc3524e83e52..3318c7c2b32b 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -376,8 +376,10 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 
 	if (test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
 		ret = ath11k_mhi_read_addr_from_dt(mhi_ctrl);
-		if (ret < 0)
+		if (ret < 0) {
+			mhi_free_controller(mhi_ctrl);
 			return ret;
+		}
 	} else {
 		mhi_ctrl->iova_start = 0;
 		mhi_ctrl->iova_stop = 0xFFFFFFFF;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
