Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B93D11701
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 06:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui0lZ09pWNZU+V6mRze3Pj/4itXlS1YP8PPe0mfjYbY=; b=JD8Np6wseAYeFOIj/dLviXn1Jq
	QGR1kZInneCCkgyHckEZAcGoafgfRcgn3ttQRkpnorv+t8KHOhSimx8pLgJqt6Ef2xAfaiXPWwLIa
	ErjfMQyHnii58nlvMchHXseH5JEM3UWPgW7Rkk1TJY6RJ0xP69YLCU2ngwXd1ZBo4uHhOTuVePKZT
	q8DQwIAXFNLYuA6kuZ9iXqU8OA0Op3Voce0jKeARMh0sdo4f0uq3jvAPE+mVe+O+Um1kuNP1mQN4U
	s2axDAdAu61wobAxhHUbGiM0Q/TExmHPuFjMeZ3pwZk3mX5KP+q4Q2zTm1OzmpJvkmBKi9Vd7puSg
	nHGiweoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4E2N-00000002iFj-2iu1;
	Fri, 25 Oct 2024 06:43:07 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4E1e-00000002i4V-0fFY
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 06:43:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XZY8c0S1MzQsG3;
	Fri, 25 Oct 2024 14:41:20 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id 08CCF140337;
	Fri, 25 Oct 2024 14:42:14 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 25 Oct 2024 14:42:13 +0800
Subject: Re: [PATCH] ath11k: remove error checking for debugfs_create_file()
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	<linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20241025063614.368-1-thunder.leizhen@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2aa6fb4a-157c-b5cd-f246-22bcb2636b66@huawei.com>
Date: Fri, 25 Oct 2024 14:42:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20241025063614.368-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf100006.china.huawei.com (7.185.36.228)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_234222_393452_EBE96B6D 
X-CRM114-Status: UNSURE (   8.53  )
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


Sorry, Forgot to add v2 to the subject. I will repost.

On 2024/10/25 14:36, Zhen Lei wrote:
> Driver ath11k can work fine even if the debugfs files fail to be created.
> Therefore, the return value check of debugfs_create_file() should be
> ignored, as it says.
> 
> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/net/wireless/ath/ath11k/spectral.c | 24 ----------------------
>  1 file changed, 24 deletions(-)
> 
> v1 --> v2:
> Remove error checking for debugfs_create_file() instead of fixing it.
> 


-- 
Regards,
  Zhen Lei

