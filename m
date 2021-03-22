Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAA7C433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:06:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EEC619B5
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EEC619B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jtds1cuS58bHJQ+b3C3xTuf7JrbeT61MDctVuCgpyaA=; b=RnDYj+B5j4fcmoeNuSK0cMfY/
	JflCCOgWbF1tyAht1i/ho26AAVLsiCXFsC1Fa9GoacNqOpwYG9k23BRqflBWGIc+L9tOs28QMutgI
	I3gCbfLZtaWZC74tZ7CIIU4nLGdHBslfLJyIz8sutwivljePpaCzJjUXzO9lpWlm3bEd6IQlzCluH
	fI84LSO3uj7VD8YRHi2TSpfr51+GQW0vL3Xv0IY3clddac203m6CSQHVUiBToupzbKAJfa0xmjshT
	MLDZO0I0BsRYok8Cb9tA86JNV1VlbXzaWx+g3hZjI/1Otx7zKxg2ONCpO6u5PWtorvuAFoDsp0mCQ
	5nivwv8YQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON4T-00ByFe-CM; Mon, 22 Mar 2021 16:06:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON3P-00Bxof-Q6; Mon, 22 Mar 2021 16:05:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72908619A9;
 Mon, 22 Mar 2021 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429118;
 bh=EPe3bIidXGt1QSXUt8K/T9qB09rG8+BNJJvNG8YjWag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=odvbczUMlcMOL6OYbdCtO6qt6RZm272nfTphlFLY6klU5CkTn017tx34pnASZGNCF
 IpTcV7nYkdiHmdTO4YSIbtaihkUG1yjP/yyOdl4AEWNcNqBp3RlBD18ZnYm597BmUn
 wbL0s1j6ZDhyXNOvtPSEo+IomEmxiiG2PhvFgAApDhn6IwYxk6QphMYP+c26QRueLZ
 RufWjyGVlIhAtQ1wf9LhLwHYQjNNIjPOnznUa3dYOSsg79XhSsMNd+utp3nEch/2kA
 G7BxSH7No+IViGt23UWj5mYSj83XwgoEag8qXDcmE/UvDP4IP5Eh1a52oCa4LWy515
 1pAfWyFQAG1Kg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, Lee Jones <lee.jones@linaro.org>,
 Colin Ian King <colin.king@canonical.com>, Ye Bin <yebin10@huawei.com>
Subject: [PATCH 09/11] scsi: lpfc: fix gcc -Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:47 +0100
Message-Id: <20210322160253.4032422-10-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160522_221243_7C1D3A1C 
X-CRM114-Status: GOOD (  10.83  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 warns about an strnlen with a length larger than the size of the
passed buffer:

drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_nvme_info_show':
drivers/scsi/lpfc/lpfc_attr.c:518:25: error: 'strnlen' specified bound 4095 exceeds source size 24 [-Werror=stringop-overread]
  518 |                         strnlen(LPFC_NVME_INFO_MORE_STR, PAGE_SIZE - 1)
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this case, the code is entirely valid, as the string is properly
terminated, and the size argument is only there out of extra caution
in case it exceeds a page.

This cannot really happen here, so just simplify it to a sizeof().

Fixes: afff0d2321ea ("scsi: lpfc: Add Buffer overflow check, when nvme_info larger than PAGE_SIZE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/scsi/lpfc/lpfc_attr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index bdd9a29f4201..f6d886f9dfb3 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -512,11 +512,9 @@ lpfc_nvme_info_show(struct device *dev, struct device_attribute *attr,
 				"6314 Catching potential buffer "
 				"overflow > PAGE_SIZE = %lu bytes\n",
 				PAGE_SIZE);
-		strlcpy(buf + PAGE_SIZE - 1 -
-			strnlen(LPFC_NVME_INFO_MORE_STR, PAGE_SIZE - 1),
+		strlcpy(buf + PAGE_SIZE - 1 - sizeof(LPFC_NVME_INFO_MORE_STR),
 			LPFC_NVME_INFO_MORE_STR,
-			strnlen(LPFC_NVME_INFO_MORE_STR, PAGE_SIZE - 1)
-			+ 1);
+			sizeof(LPFC_NVME_INFO_MORE_STR) + 1);
 	}
 
 	return len;
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
