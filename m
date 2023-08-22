Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CF2EE4996
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sA4IeST85N4vMv0124UaW9rUgNw2F/VOfPrCY3c6Z7s=; b=nNYlpXdjUhPWMn
	Eb27eKF8zjKM+Cl+u10w8dX+aTik39sl4jvADZ72zFDfE+y1HdcAhsc2q3+3xIYdW7zOxE3p8uGIX
	qoZ3vaCK2Fmkam5Nlu4z4EBWq3MbpgEmM1XklGvWV8MwxCOm1f4FMcEg2yP62moeEtXlMvIn2qj/h
	BcCMsXqxIObcowfPy3fVv3F6BIDDx450p9yFBVqBeFzwioFVIwhBmx9xgLPjxgdMaAf22q+s+a79x
	16fv3bNv6Ly1/+ajYVJlhx7/cQtFqcA8mVNT+9SykZKA/xiaG9AjskUotkuscPWfRBlmv1fO23PNO
	K1WN8IMSD0HkJ6sCYi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQqB-00FvyA-1W;
	Tue, 22 Aug 2023 12:50:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQq9-00Fvxi-0H
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 12:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E4E163CB2;
	Tue, 22 Aug 2023 12:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D380C433C7;
	Tue, 22 Aug 2023 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692708630;
	bh=VOj/H3WFw6eAeJRXThByUZWJHDAa+HeOqkE4Tbwj1es=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GxQ+f4GfMdjxe14JaXdnUgyeqnvdIT+79tKy8RPl00B3ETu6V3mU0hS4Wb9nvuskx
	 zNvxG2l1h9POMod6OcEwMlgS1Cl3agHi5hJtyY3NGJSfZXUeOrDJM83SNs39kAdc1m
	 n5gsU3+5HJh9HYMIlvy5uNGBYQan2WRjhrAgCBk7ne3ziBhzBZ1sGnXf6EeQXuP3Ns
	 7LOMJwy57X703vLSS7ZTt71gz+VIh5/jxfJl/RyRL1lRuurfOImFkEiZ0piq7koQKf
	 ljbbFr1lM274WU+YH0Z33N5QzsycC/NMVOZNymY8PVCfX2qYSWS+HyWVjNHqRuab8+
	 Rtm5mU+eHOEPg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Baochen Qiang
 <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
	<87fs70hlel.fsf@kernel.org>
	<545cc8e8-481d-85b2-5692-43580936b48d@quicinc.com>
	<897b61ea-36d2-1ab4-9c60-9bdfd2d9cad7@quicinc.com>
	<fa70ca5e-001b-3c6b-dbc2-2853f8fc2f72@quicinc.com>
	<fcb783b4-95e9-24d8-a656-b273a79598a0@quicinc.com>
	<4720b820-523a-477a-436c-72fceb4a6a12@quicinc.com>
Date: Tue, 22 Aug 2023 15:50:27 +0300
In-Reply-To: <4720b820-523a-477a-436c-72fceb4a6a12@quicinc.com> (Manikanta
	Pubbisetty's message of "Tue, 8 Aug 2023 10:37:47 +0530")
Message-ID: <87sf8bi6lo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_055033_190640_C24A8C73 
X-CRM114-Status: UNSURE (   9.66  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> On 8/7/2023 8:59 PM, Jeff Johnson wrote:
>> On 8/7/2023 3:16 AM, Manikanta Pubbisetty wrote:
>>> No impact on WCN6750.
>>>
>>> Tested-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> Can you provide a Tested-on: flag that Kalle can add to the commit
>> text?
>> 
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1

Excellent, thanks. The more Tested-on tags I see on the patch the more
confidence I have for the patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
