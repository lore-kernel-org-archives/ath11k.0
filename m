Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13753C4725D
	for <ath11k@archiver.kernel.org>; Fri, 19 Jan 2024 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNYtM6AiBylxlIk97xM/9i7woT1uLMtcNB251ymB91o=; b=mHIydE23pDqDk3Re1u4ePqh4jS
	7Z/sAlbT5rFcoOW2+lP4dzVi92qHPycUmGO7crVqyI0mj5YDt3FIDlOckAbQ/Nix3i6tWUTrycUNV
	JfoBkfmAZFwjp3g0RZTQEZwJrYH+eWAmp7sRiLmjVX0yXHQSOCA3Nx4r+pqfhC/wsM06kUN6K6IM5
	ks++QOTfhtHSwexvpDb2c3vDzwjRQqYocyJLJddxDnU+2nZCZn7VcJISps9C+BbSSUeRbaJe74PQu
	JQcDZvopZzwPFjltBkLIqy/ou80bPrS5GzlEKapcWu/N84oaSAsBx2PJFPQavPtOMXzbcvwuIudR8
	nf0Y72+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQt7d-006JpY-0s;
	Fri, 19 Jan 2024 17:57:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQt7a-006JpD-2j
	for ath11k@lists.infradead.org;
	Fri, 19 Jan 2024 17:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 45DBFB81C8B;
	Fri, 19 Jan 2024 17:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712C0C433C7;
	Fri, 19 Jan 2024 17:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705687056;
	bh=glpfq4hbtmxDnxhNCbJl2gUxB9QM02op/pILNZ0Ylu4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=maCrIHqR24O988odrnn7jwbVzCa6G8tnsFuwBgPWbHbCfyGh6C7Wu5dId0x46WT7B
	 geMVEnqref7lKhJfZIkSNhC3zFS/Jxa1c3QI73JIF2ofh0/nNNpmG4nA+6qCdw/x2b
	 TiNAIk2Pa89/BDF/CUBs9Ph1Nsq8eJohS1YdPcsTppqtYUZ91v2UcLhdjzY6tZNNYV
	 L0e5ZOYXJlM7SZ6TFQYkeUSGY2hl5j2u56GIbNhaVoX9AojLuF29FF2K/yTE+gc6y5
	 Mrwg6jlreWcu8Cogq41JV+zVCwQmVzfdHbjvAjzg48xVN1FQ4lvq+NLUNaDrcyfg2a
	 HzbkVWTEPZdFg==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
  linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: ath11k and vfio-pci support
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<8734v5zhol.fsf@kernel.org>
	<87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
	<87r0ipcn7j.fsf@kernel.org>
	<356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
	<26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
	<87mstccmk6.fsf@kernel.org>
	<df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
	<8734v4auc4.fsf@kernel.org>
	<e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
	<285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
	<4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
	<3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
	<ee0280fd-032c-4f45-a3f9-50d96d8bed6d@gmail.com>
	<16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
	<cdec259a-b779-4856-8585-f285179e3671@gmail.com>
	<21e925bc-ee3e-4421-949b-b3839d2abdef@quicinc.com>
	<08457e37-49f4-4c51-998b-e577731c8022@gmail.com>
Date: Fri, 19 Jan 2024 19:57:33 +0200
In-Reply-To: <08457e37-49f4-4c51-998b-e577731c8022@gmail.com> (James
	Prestwood's message of "Fri, 19 Jan 2024 09:52:19 -0800")
Message-ID: <87o7dh2oky.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_095739_048951_407C24AA 
X-CRM114-Status: UNSURE (   8.56  )
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

James Prestwood <prestwoj@gmail.com> writes:

>> Sorry I should have made it clear:
>> step1: start qemu and load ath11k without changing anything, then
>> you get those errors;
>> step2: keep qemu running and ath11k there, don't unload it. Then
>> check lspci output in host to get the MSI vector.
>> step3: Back in qemu, hard code MSI vector to the one you get in
>> step2, then rebuild and reload ath11k.
>
> Thank you for the clarification, this worked like a charm!

Very nice, huge thanks to Baochen for finding the workaround! James, let
us know how it works for you in the long run. This would definitely help
automating ath11k testing so I'm very interested about this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

