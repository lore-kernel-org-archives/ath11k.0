Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvXm-0000Pp-2z
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:47:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Remove probe response offload template setup
References: <1559561890-27984-1-git-send-email-srirrama@codeaurora.org>
 <20190606164126.5EA7D60CED@smtp.codeaurora.org>
Date: Thu, 06 Jun 2019 19:47:07 +0300
In-Reply-To: <20190606164126.5EA7D60CED@smtp.codeaurora.org> (Kalle Valo's
 message of "Thu, 6 Jun 2019 16:41:26 +0000 (UTC)")
Message-ID: <87d0jqveyc.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Sriram R <srirrama@codeaurora.org> wrote:
>
>> Probe response offload support is not supported by
>> IPQ8074 firmware. Hence do not advertise or set probe
>> response template to the firmware.
>> 
>> This would avoid the below error during template setup.
>> 'failed to update prb tmpl -1'
>> 
>> Signed-off-by: Sriram R <srirrama@codeaurora.org>
>
> New warnings:
>
> drivers/net/wireless/ath/ath11k/wmi.c:4597:34: warning: mixing different enum types
> drivers/net/wireless/ath/ath11k/wmi.c:4597:34:     unsigned int enum dfs_reg versus
> drivers/net/wireless/ath/ath11k/wmi.c:4597:34:     unsigned int enum ath11k_dfs_region
>
> Patch set to Changes Requested.

Actually I'll take that back, I don't drop this patch. I got confused
which commit caused those. It's actually this one:

b0d742f32bc3 ath11k: Fix vdev start failure when operating in CN, KR regdomain

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
