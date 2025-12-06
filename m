Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73335D3B7DB
	for <ath11k@archiver.kernel.org>; Sat,  6 Dec 2025 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ndXm3Qn/OsGO81rziqfjrS+2oqoVZi3ZmGOqkEVkigA=; b=wokBt9gcO49xT4oIZGNDDWNXWY
	swwzWBfeNjCzL8bCK0JSstagcxqNSiTASn8O+7CgFFynclLGlEzaSdtTS7JqL17tdwcD9D56A3FH+
	f8oa2GweNludS9XVxiI+OQnOEl3Mvil/Y8cZ5pMHKyCWCOD6MfNg0zeb/oROTnawLc10443LO/Gz8
	3frLmZcE+NwKRaZLuz/WyvpIqira37sy4rXOPO7JoZXaq3pT2YB4laCa2fHATykfjeswO3v1CEx88
	mGFd+xuwM7iF2ASK6iMfFArpgXVNYVfblT4tBCwuIKMZuyZ0sJdJq00u4ddgDuskC/zUpzMGm3Rz5
	jOCoPpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwYF-0000000B6kX-308o;
	Sat, 06 Dec 2025 17:58:35 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwYE-0000000B6kB-1K6n
	for ath11k@lists.infradead.org;
	Sat, 06 Dec 2025 17:58:35 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7c75178c05fso1234354a34.0
        for <ath11k@lists.infradead.org>; Sat, 06 Dec 2025 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765043913; x=1765648713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndXm3Qn/OsGO81rziqfjrS+2oqoVZi3ZmGOqkEVkigA=;
        b=d4/Y9CaaDtBS54LqNDWxCSodEJg1GXxbDF8/MdbaEOQEZC8LqIOBsdpS9WWNUd/ZEH
         SzCb960L+jxmZBwOycs6JO1OO5/AeYbN8zM98Psb6Cm1+R57gg5cdtcrX01zWkPvl//1
         Bv6PuI9smza77tqshY7H3jZUc+BsYT4H4bI1SWyBauACgAHo/tZS9fby59cwHj2QY3MF
         GMLHIRszkoLzLuaMeuBG8f6mtNy637tPysXq659Q4Qirjq68uViJxTLK2rznAW9bQFUH
         BfUMY1//Vm5/4Xd6Ba4gbyXjswnhapJ11/oacuQGcoL3subyLIHIKKFK3wO47ui4TfDX
         kWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765043913; x=1765648713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndXm3Qn/OsGO81rziqfjrS+2oqoVZi3ZmGOqkEVkigA=;
        b=Qb7Cy+28/4sEOphJv1oIAumVFb4+uYO+Nm6V/uHod7RbYyxphAYEJByLAmdSl4Onzf
         LWTH8fjig26emDpbf6FCw21pOT9Imrc5+ZF6kAKbVe9ABbjWOdOG0PP9EB5S83gwz7Xb
         1a5ocZdjXBX53d3w8h82674UPgdqT/X2IEOTr54BETqP5X80gtoaFdCKpS8Tz58fCRi1
         ivPR5F9Mu/vPX43xqoYcM4UCzrjwc4w6HLXt/JEQRrh5vilI9tEJjTkx65+AKRD8MuEt
         uFp0h6Q9IzEg835Q6mLTZnR+IDb1sttxEXSfWPOgYzo2ivxhsQgo3x1FInF/729yL6OB
         5gZg==
X-Forwarded-Encrypted: i=1; AJvYcCUMH56jfhtsb736ggs0gf3C1UP5eQODW72udqI7BTde5PDR77FXjyBLJIFlvC9ZbtRJ4UwqBVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxelZLx52KqfJymTvcw5Sd/KEaH8WB1lP36pBqDBrrQIgPxr6i+
	o78hqm5+QtXCIwK9Br4BmDg+OP+csBe09sv1cYm2Jc8hXbsrC14qWpZN
X-Gm-Gg: ASbGncvgYzAYc5ukfXB+FOo1TNA8glfd0OEe9SOZDfwnyrIhXL5xJfgwIWXeIWx6i7c
	fSdd1WTkbltQJJg+M1Q3GthTnjCUgmDVmFqMzd1EOBFF69y7vlh89iHlWAiARxyPeZMmyidBHck
	5GSGLAchL/K78XDCCIczlr4aBoSG1869/hkOzTPJLLm1U1R5te9/SGAwpL83WAQ7+Dj5KXc3mE/
	CFUFlVaT9fCmqmYbIue+euGikyXUPRM1srnLW/I3UZrKp1uV7xtnGpr9gJlWLuz5AkmsTfzKUoe
	8/t033X9xmc9w/kW46WGQdsmZHLvZyDmUx3VxA6c7fQTx+/bfMhuNZSq0ldTF90aHpWY4pwdsye
	VxhI9/pKIEzjbyHHKrjhQk/z3w+JP95aA4pDTiGnL9x12CgtyyPi929aJ7XmVh/TUzprQFchyh8
	Np3zwGXuNrHuHYcfx5YZ+l49xYVe6frVjrM5ttRc+4LfeuKWFPYk3zmgDkOTI6rqrxecIkaZbsf
	W0OqHSOXxawkrUOx9CpT6SSFP67nYp1yXE3uBg=
X-Google-Smtp-Source: AGHT+IFIWED3uQzX/seC5IXNBJh7DeKjOKVTT2ma7XA8fASm3D5ShSB8BPB71NDBWxDFvLk9L8iynQ==
X-Received: by 2002:a05:6830:442b:b0:7c7:6bb4:1197 with SMTP id 46e09a7af769-7c9708124b4mr1575504a34.24.1765043912850;
        Sat, 06 Dec 2025 09:58:32 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acadb16sm6372782a34.21.2025.12.06.09.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 09:58:32 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: jjohnson@kernel.org,
	ath11k@lists.infradead.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	stable@vger.kernel.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH] wifi: ath11k: fix qmi memory allocation logic for CALDB region
Date: Sat,  6 Dec 2025 11:58:29 -0600
Message-ID: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_095834_386117_6A46A8EE 
X-CRM114-Status: GOOD (  12.32  )
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

Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
assumes that:
  1. firmware will make a HOST_DDR_REGION_TYPE request, and
  2. this request is processed before CALDB_MEM_REGION_TYPE

In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
after the host region.

However, if the HOST_DDR_REGION_TYPE request is not made, or the
reserved-memory node is not present, then res.start and res.end are 0,
and host_ddr_sz remains uninitialized. The physical address should
fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:

resource_size(&res) returns 1 for an empty resource, and thus the if
clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
is assigned the uninitialized value of host_ddr_sz + 0 (res.start).

Use "if (res.end > res.start)" for the predicate, which correctly
falls back to ATH11K_QMI_CALDB_ADDRESS.

Fixes: 900730dc4705 ("wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"")

Cc: stable@vger.kernel.org # v6.18
Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aea56c38bf8f3..6cc26d1c1e2a4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2054,7 +2054,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 				return ret;
 			}
 
-			if (res.end - res.start + 1 < ab->qmi.target_mem[i].size) {
+			if (resource_size(&res) < ab->qmi.target_mem[i].size) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
 					   "fail to assign memory of sz\n");
 				return -EINVAL;
@@ -2086,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			}
 
 			if (ath11k_core_coldboot_cal_support(ab)) {
-				if (resource_size(&res)) {
+				if (res.end > res.start) {
 					ab->qmi.target_mem[idx].paddr =
 							res.start + host_ddr_sz;
 					ab->qmi.target_mem[idx].iaddr =
-- 
2.45.1


