Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFtvn-0007J3-87
 for ath11k@lists.infradead.org; Wed, 09 Sep 2020 06:50:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: Add peer max mpdu parameter in peer assoc
 command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588611900-21185-2-git-send-email-tamizhr@codeaurora.org>
References: <1588611900-21185-2-git-send-email-tamizhr@codeaurora.org>
Message-ID: <0101017471a0f48d-84b5c29f-ae8c-46b1-8f34-167fdb66b284-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2020 06:50:07 +0000
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> Add peer max mpdu length configuration support in peer_assoc_he
> parameters. Noticed low throughput for the STA which
> supports HE, HT and not VHT in MU-MIMO case without this
> configuration
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

af6d39db1b04 ath11k: Add peer max mpdu parameter in peer assoc command

-- 
https://patchwork.kernel.org/patch/11526769/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
