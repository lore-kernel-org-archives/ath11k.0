Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D93C433F5
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjJ+oMwg9joKmc0gDoOO0VuZbBA4KMachrdIQBQ3x7Q=; b=t5t30qrr7Ugd1o
	Rtw928Pazok+JCGN6zG45RlG4kAp+RZnG/CHNOBLQx5o1qB9D96Xrs8bi+7uLNLpxLR0Nx6wX035H
	l9fYz9CHnebhovn6Lw+szNm67l1u8mdnRQsDb7R6aNy08a7v40U15JQCGcwnHqVH49UChKNjbaGNl
	gAdBJL5hTigRoyp7bhcVCurSHHpE7yYTzST7vglxUQlTsF+bg/8CRIeFDfdwwCr48CB1RGDRD0UC0
	F53xFvT/yBie6cTQDUC6RPNWHehnLGXXxumYCgjHhShuOq7vfkkGwZEvNoHruu/6ahzEmQUbFLGQq
	b0AHUwqcIG/kY/dUhszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmy21-003Tf4-U5; Fri, 06 May 2022 13:30:05 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmxxR-003QuE-V6
 for ath11k@lists.infradead.org; Fri, 06 May 2022 13:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651843522; x=1683379522;
 h=from:to:cc:subject:references:date:in-reply-to:
 message-id:mime-version;
 bh=NTCblvEg2Je6e7z19KLeX5d93hFqzf9TDQbHKIYfQwg=;
 b=qJwTQXwI6vzGVBgmI5fLxsAmr6YyODJE5KiFx+h84kJSvAAuD098sxJS
 bpcW26mBKb0ltewpQctIhMhaqqArMOgBq5fIKBiqFW7YbKQ9Db6gHf4lr
 2cVMmxNBIpfRPTPY+hyi69KhjZRovoVBwKBlHg5/oUe3dgOVnL/JbF2I0 8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 06 May 2022 06:25:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:25:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 06:25:20 -0700
Received: from kvalo10 (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 06:25:18 -0700
From: Kalle Valo <quic_kvalo@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
CC: Dan Carpenter <dan.carpenter@oracle.com>, <kbuild@lists.01.org>,
 <lkp@intel.com>, <kbuild-all@lists.01.org>, Linux Memory Management List
 <linux-mm@kvack.org>, <ath11k@lists.infradead.org>, Wen Gong
 <quic_wgong@quicinc.com>
Subject: Re: [linux-next:master 408/8237]
 drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
 inconsistent returns '&ar->conf_mutex'.
References: <202205032236.kofEquX3-lkp@intel.com> <o5hh7658dxr.fsf@quicinc.com>
 <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
Date: Fri, 6 May 2022 16:25:15 +0300
In-Reply-To: <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com> (Carl Huang's
 message of "Thu, 5 May 2022 09:29:40 +0800")
Message-ID: <o5h7d6y7pz8.fsf@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (windows-nt)
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_062522_135485_BE275553 
X-CRM114-Status: UNSURE (   6.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Carl Huang <quic_cjhuang@quicinc.com> writes:

> Hi Kalle,
>
> Is the below the same fix that you have already applied to ath.git?
>
> [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume() - Patchwork (kernel.org)

BT please don't use HTML in emails, linux lists drop HTML email.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
